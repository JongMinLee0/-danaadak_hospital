package com.dana.hos.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestOperations;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.map.module.HosDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.member.service.MemberService;
import com.fasterxml.jackson.databind.node.ObjectNode;

@Controller
public class MemberController {

	@Autowired
	MemberService memberservice;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
    @Qualifier("kakaoRestTemplate")
    private RestOperations kakaoRestTemplate;
	
	@RequestMapping("/kakao/userinfo")

    public String userinfo(Model model,HttpServletRequest request) {
        String returnUrl = "redirect:/login.do?error";
        ObjectNode result = (ObjectNode)kakaoRestTemplate.getForObject(
                "https://kapi.kakao.com/v1/user/me",ObjectNode.class);

//      result {"id":120160638,"properties":{"nickname":"nickname","thumbnail_image":"","profile_image":""}}
        if (result != null) {
            final HttpSession session = request.getSession();
            final SecurityContext securityContext = SecurityContextHolder.getContext();
            final UsernamePasswordAuthenticationToken authentication = 
                  new UsernamePasswordAuthenticationToken(
                      result.findPath("id").asText(), 
                      "null",
                      AuthorityUtils.commaSeparatedStringToAuthorityList("ROLE_SOCIAL")
                  );

            authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
//          Security Login

            securityContext.setAuthentication(authentication);
            SecurityContextHolder.setContext(securityContext);

//          session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
            session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, securityContext);

            returnUrl = "redirect:/";
        }



        return returnUrl;   

    }
	
	@RequestMapping(value = "/login")
	public ModelAndView loginForm(HttpServletRequest request, String successMsg, ModelAndView mav) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referer);
		
		mav.addObject("successMsg", successMsg);
		mav.setViewName("member/login/loginForm");

		return mav;
	}
	
	@RequestMapping(value = "/login/accessDenied", method = RequestMethod.GET)
	public String accessDenied() {
		return "member/login/accessDenied";
	}
	
	@RequestMapping(value = "/login/typeChk", method = RequestMethod.POST)
	public @ResponseBody String typeChk(String username) {
		MemberDTO dto = memberservice.userInfoProcess(username);
		return dto.getType();
	}

	@RequestMapping(value = "/kakao_login")
	public @ResponseBody int kakao_login(MemberDTO dto) {
		return memberservice.kakaoChkProcess(dto.getKakao_id());
	}
	
	@RequestMapping(value = "/kakao_login_action")
	public @ResponseBody MemberDTO kakao_login_action(MemberDTO dto) {
		return memberservice.kakaoLoginProcess(dto.getKakao_id());
	}

	@RequestMapping(value = "/member/findIdPwForm", method = RequestMethod.GET)
	public String findIdPwForm() {
		return "member/login/findIdPw";
	}
	
	@RequestMapping(value = "/member/findIdPwForm", method = RequestMethod.POST)
	public String findIdPw(String result, ModelAndView mav) {
		mav.addObject("result", result);
		System.out.println(result);
		return "member/login/findIdPw";
	}
	
	@RequestMapping(value = "/member/findIdPw", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String findIdPw(String type, MemberDTO dto, ModelAndView mav) {
		String result = "";
		if(type.equals("findId")) {
			try{
				String username = memberservice.findIdProcess(dto).getUsername();
				System.out.println(username);
				result = "고객님의 아이디는 '"+username+"'입니다.";
			}catch(NullPointerException e){
				result = "해당하는 정보가 없습니다.";
			}
		}else {
			if(memberservice.findPwProcess(dto)!=1) {
				result = "해당하는 정보가 없습니다.";
			}else {
				result = "비밀번호 수정";
			}
		}
		
		return result;
	}

	@RequestMapping(value = "/member/passwordChange", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String changePw(MemberDTO dto) {
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword())); // 암호화 하여 테이블에 저장
		memberservice.changePw(dto);
		return "비밀번호 변경에 성공하셨습니다.";
	}
	
	@RequestMapping(value = "/join/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/join/joinForm";
	}

	@RequestMapping(value = "/join/join", method = RequestMethod.POST)		// 일반 사용자 회원가입
	public ModelAndView join(MemberDTO dto, ModelAndView mav, HttpServletRequest request) throws IOException {
	//	dto.setAddress(dto.getAddress().replaceAll(",", " "));
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword())); // 암호화 하여 테이블에 저장
		if(dto.getBirth()!=null) {
			dto.setBirth(dto.getBirth().replaceAll(",", ""));
		}
		
		System.out.println(dto.getProfile_image());
		
		if(dto.getProfile_image()==null || dto.getProfile_image().equals("") || dto.getProfile_image().equals("null") ) {
			dto.setProfile_image("/hos/resources/images/defaultIcon.png");
		}
		
		memberservice.joinProcess(dto);
		
		mav.addObject("successMsg", "회원가입에 성공하셨습니다.");
		mav.setViewName("redirect:/login?type=user");
		
		return mav;
	}
	
	@RequestMapping(value = "/join/hosjoin", method = RequestMethod.POST)	// 병원 회원가입
	public ModelAndView hosjoin(MemberDTO dto, ModelAndView mav, HttpServletRequest request) {
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword())); // 암호화 하여 테이블에 저장
		memberservice.hosjoinProcess(dto);
		
		mav.addObject("successMsg", "회원가입에 성공하셨습니다.");
		mav.setViewName("redirect:/login?type=hospital");
		
		return mav;
	}

	@RequestMapping(value = "/join/phone", method = RequestMethod.GET)
	public String phone(Model model) {
		return "member/join/phone";
	}
	
	@RequestMapping(value = "/join/findHos", method = RequestMethod.POST)
	public @ResponseBody List<HosDTO> replyListPage(String keyword){
		return memberservice.findHospitalProcess(keyword);
	}
	
	@RequestMapping(value = "/join/usernameChk", method = RequestMethod.POST)
	public @ResponseBody int usernameChk(MemberDTO dto) {
		return memberservice.usernameChkProcess(dto.getUsername());
	}
	
	@RequestMapping(value = "/join/hospitalChk", method = RequestMethod.POST)
	public @ResponseBody int hospitalChk(MemberDTO dto) {
		return memberservice.hospitalChkProcess(dto.getHos_id());
	}


}
