package member;

import java.util.HashMap;
import java.util.Map;

public class MemberValidator {

	private void checkNull(String value, String fieldName, Map<String, String> errors) {
		if (value == null || value.trim().isEmpty()) {
			errors.put(fieldName + "Null", fieldName + "을 입력해야 합니다.");
		}
	}

	private void checkMaxLength(String value, String fieldName, int max, Map<String, String> errors) {
		if (value != null && value.length() > max) {
			errors.put(fieldName + "TooLong", fieldName + "은 " + max + "자 이하여야 합니다.");
		}
	}

	public Map<String, String> validate(String memberId, String password, String name, String email) {
		Map<String, String> errors = new HashMap<>();

		checkNull(memberId, "memberId", errors);
		checkNull(password, "password", errors);
		checkNull(name, "name", errors);

		checkMaxLength(memberId, "memberId", 10, errors);
		checkMaxLength(password, "password", 10, errors);
		checkMaxLength(name, "name", 20, errors);
		checkMaxLength(email, "email", 80, errors);

		return errors;
	}

	public Map<String, String> validateName(String name) {
		Map<String, String> errors = new HashMap<>();
		checkNull(name, "name", errors);
		checkMaxLength(name, "name", 20, errors);

		return errors;
	}

}