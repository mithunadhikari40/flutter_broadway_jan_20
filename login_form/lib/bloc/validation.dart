import 'dart:async';

final emailValidator = StreamTransformer.fromHandlers(
  handleData: (email,sink){
    if(email.contains("@") && email.contains(".")){
      sink.add(email);
    }else{
      sink.addError('Invalid email address');
    }
  }
);


final passwordValidator = StreamTransformer.fromHandlers(
  handleData: (pass,sink){
    if(pass.length >4){
      sink.add(pass);
    }else{
      sink.addError('Password must be at least 4 characters long');
    }
  }
);