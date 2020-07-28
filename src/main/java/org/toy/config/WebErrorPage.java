package org.toy.config;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.toy.common.Constants;

@ControllerAdvice
public class WebErrorPage {

	@ExceptionHandler(NoHandlerFoundException.class)
    public String handle(Model model, Exception ex) {
		model.addAttribute("defaultPath", Constants.DEFAULT_PATH);
        return "error.error";
    }
	
}
