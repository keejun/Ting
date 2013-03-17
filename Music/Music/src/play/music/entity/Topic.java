package play.music.entity;

public class Topic {
	public Topic (){
		
	}
   public int getAlid() {
		return alid;
	}
	public void setAlid(int alid) {
		this.alid = alid;
	}
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	public String getPubren() {
		return pubren;
	}
	public void setPubren(String pubren) {
		this.pubren = pubren;
	}
	public String getPubtime() {
		return pubtime;
	}
	public void setPubtime(String pubtime) {
		this.pubtime = pubtime;
	}
	public int getIsonline() {
		return isonline;
	}
	public void setIsonline(int isonline) {
		this.isonline = isonline;
	}
	public String getReplyren() {
		return replyren;
	}
	public void setReplyren(String replyren) {
		this.replyren = replyren;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReplytime() {
		return replytime;
	}
	public void setReplytime(String replytime) {
		this.replytime = replytime;
	}
   private int alid;
   private String ques;
   private String pubren;
   private String pubtime;
   private int isonline;
   
   private  String replyren;
   private  String reply;
   private  String replytime;
   
}
