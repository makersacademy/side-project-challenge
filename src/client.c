#include <stdio.h> 
#include <unistd.h>
#include <string.h> 
#include <sys/socket.h> 
#include <netinet/in.h>
#include <netdb.h> 

int main(int argc,char *argv[])
{
    /* first what are we going to send and where are we going to send it? */
    int portno =        80;
    char *host =        "www.google.com";
    char *message = "GET HTTP/1.0\r\n\r\n";

    struct hostent *server;
    struct sockaddr_in server_address;
    int sockfd;

    printf("Request:\n%s\n",message);

    sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (sockfd < 0) perror("ERROR opening socket");

    server = gethostbyname(host);
    if (server == NULL) perror("ERROR, no such host");

    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(portno);
    memcpy(&server_address.sin_addr.s_addr,(*server).h_addr,(*server).h_length);

    if (connect(sockfd,(struct sockaddr *)&server_address,sizeof(server_address)) < 0)
        perror("ERROR connecting");
    else printf("Connection successful.\n");

    close(sockfd);

    return 0;
}
