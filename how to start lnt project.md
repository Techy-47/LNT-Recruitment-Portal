\#how to start lnt project



1\. save  all file 

2\. run *mvn clean package* in powershell terminal

3\. replace

&#x09;	C:\\Users\\79856\\Desktop\\Code Base\\Lnt\_Project\\target\\recruitment-portal-1.0-SNAPSHOT.war 

&#x09;with 

&#x09;	C:\\Program Files\\Apache Software Foundation\\Tomcat 10.1\\webapps\\recruitment-portal-1.0-SNAPSHOT.war 

4\. press win + R

5\. type *services.msc*

6\. find Apache Tomcat 10.1 Tomcat10 and start or restart it

7\. open local server 

&#x09;for admin : http://localhost:8080/recruitment-portal-1.0-SNAPSHOT/admin/login

&#x09;for candidate : http://localhost:8080/recruitment-portal-1.0-SNAPSHOT/auth/login.jsp

&#x09;for employer : http://localhost:8080/recruitment-portal-1.0-SNAPSHOT/employer/login.jsp



