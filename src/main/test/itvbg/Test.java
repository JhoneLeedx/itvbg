package itvbg;


import com.yxt.jhonelee.util.Md5Util;

public class Test {

	
	public static void main(String[] args) {
		
	/*	List<User> list = new ArrayList<User>();
		for(int i=0;i<41;i++){
			User user = new User();
			user.setName((i+1)+"");
		    user.setId(i);
		    list.add(user);
		}
		Gson gson = new Gson();
		String json = gson.toJson(list);
		System.out.println(json);*/
		String pass = Md5Util.EncoderByMd5("00");
		System.out.println(pass);
	}
}
