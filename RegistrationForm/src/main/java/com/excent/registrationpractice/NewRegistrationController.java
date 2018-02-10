package com.excent.registrationpractice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class NewRegistrationController {
	@RequestMapping("/newregistration_form")
	public String newform()
	{
		return "static/NewRegistrationForm.jsp";
	}
	@RequestMapping("/listpage")
	public String listpage()
	{
		return "static/NewList.jsp";
	}
	@RequestMapping("/updatepage")
	public String updatepage()
	{
		return "static/updateform.jsp";
	}
	@RequestMapping("/reg_save")
	@ResponseBody
	public String save(@RequestParam("fname")String firstname,
			@RequestParam("lname")String lastname,
			@RequestParam("mail")String email,
			@RequestParam("gen")String gender,
			@RequestParam("uname")String username,
			@RequestParam("upwd")String password)
	{
		System.out.println("IN controller");
		System.out.println(firstname);
		System.out.println(lastname);
		System.out.println(email);
		System.out.println(gender);
		System.out.println(username);
		System.out.println(password);

		RegistrationPractice rgp= new RegistrationPractice(firstname,lastname,email,gender,username,password);
		regpract.save(rgp);
		
		return "Registered";
    }
	@RequestMapping("/user_list")
	@ResponseBody
	public List<RegistrationPractice> all() {
		return (List<RegistrationPractice>) regpract.findAll();
	}
	@RequestMapping("/single_id")
	@ResponseBody
	public List<RegistrationPractice> userpass(@RequestParam("id")long id){
		
		return (List<RegistrationPractice>)regpract.findById(id);
	}

	@RequestMapping("/data_update")
	@ResponseBody
	public String update(@RequestParam("editid")long id,
			         @RequestParam("fname")String firstname,
					@RequestParam("lname")String lastname,
					@RequestParam("mail")String email,
					@RequestParam("gen")String gender,
					@RequestParam("uname")String username,
					@RequestParam("upwd")String password)
	{
		
		System.out.println("IN controller");
		System.out.println(id);
		System.out.println(firstname);
		System.out.println(lastname);
		System.out.println(email);
		System.out.println(gender);
		System.out.println(username);
		System.out.println(password);


		
		RegistrationPractice up= regpract.findOne(id);
		up.setFirstname(firstname);;
		up.setLastname(lastname);
		up.setEmail(email);
		up.setGender(gender);
		up.setUsername(username);
		up.setPassword(password);
		System.out.println("updated");
		
		regpract.save(up);
		
return "Updated";	
}
	@RequestMapping("/data_delete")
	@ResponseBody
	public String delete(@RequestParam("id")long id){
		RegistrationPractice delete= regpract.findOne(id);
		regpract.delete(id);
		
		return "Deleted";
	}
	@Autowired
	private RegistrationPracticeRepository regpract;
}
