abstract class SignInEvent {
  const SignInEvent();
}

//* Event => when email is changed
class EmailEvent extends SignInEvent {
  final String email;
  const EmailEvent(this.email);
}

//* Event => when password is changed
class PasswordEvent extends SignInEvent {
  final String password;
  const PasswordEvent(this.password);
}
