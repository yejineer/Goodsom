package com.example.goodsom.controller.user;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * @author Seonmi Hwang
 * @since 2020.06.28
 */

@SuppressWarnings("serial")
public class LoginForm implements UserDetails {

	private String email;
	private String password;
	private String auth;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "LoginForm [email=" + email + ", password=" + password + "]";
	}
	

	  // 사용자의 권한을 콜렉션 형태로 반환
	  // 단, 클래스 자료형은 GrantedAuthority를 구현해야함
	  @Override
	  public Collection<? extends GrantedAuthority> getAuthorities() {
	    Set<GrantedAuthority> roles = new HashSet<>();
	    for (String role : auth.split(",")) {
	      roles.add(new SimpleGrantedAuthority(role));
	    }
	    return roles;
	  }

	  // 사용자의 id를 반환 (unique한 값)
	  @Override
	  public String getUsername() {
	    return email;
	  }

	  // 계정 만료 여부 반환
	  @Override
	  public boolean isAccountNonExpired() {
	    // 만료되었는지 확인하는 로직
	    return true; // true -> 만료되지 않았음
	  }

	  // 계정 잠금 여부 반환
	  @Override
	  public boolean isAccountNonLocked() {
	    // 계정 잠금되었는지 확인하는 로직
	    return true; // true -> 잠금되지 않았음
	  }

	  // 패스워드의 만료 여부 반환
	  @Override
	  public boolean isCredentialsNonExpired() {
	    // 패스워드가 만료되었는지 확인하는 로직
	    return true; // true -> 만료되지 않았음
	  }

	  // 계정 사용 가능 여부 반환
	  @Override
	  public boolean isEnabled() {
	    // 계정이 사용 가능한지 확인하는 로직
	    return true; // true -> 사용 가능
	  }
}
