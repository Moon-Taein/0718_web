package member;

public class Member {
	private String name;
	private String memberId;
	private String email;

	public Member(String name, String memberId, String email) {
		super();
		this.name = name;
		this.memberId = memberId;
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
