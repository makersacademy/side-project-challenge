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
    char *message_fmt = "GET /search?q=random&output=html HTTP/1.0\r\n\r\n";

    struct hostent *server;
    struct sockaddr_in server_address;
    int sockfd, bytes, sent, received, total;
    char message[1024],response[4096];

    sprintf(message, message_fmt, argv[1], argv[2]);
    printf("Request:\n%s\n",message);

    sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (sockfd < 0) perror("ERROR opening socket");

    server = gethostbyname(host);
    if (server == NULL) perror("ERROR, no such host");

    memset(&server_address,0,sizeof(server_address));
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(portno);
    memcpy(&server_address.sin_addr.s_addr,(*server).h_addr,(*server).h_length);

    if (connect(sockfd,(struct sockaddr *)&server_address,sizeof(server_address)) < 0)
        perror("ERROR connecting");
    else printf("Connection successful.\n");

    total = strlen(message);
    sent = 0;
    do {
        bytes = write(sockfd,message+sent,total-sent);
        if (bytes < 0)
            perror("ERROR writing message to socket");
        if (bytes == 0)
            break;
        sent+=bytes;
    } while (sent < total);
    
    memset(response,0,sizeof(response));
    total = sizeof(response)-1;
    received = 0;
    do {
        bytes = read(sockfd,response+received,total-received);
        if (bytes < 0)
            perror("ERROR reading response from socket");
        if (bytes == 0)
            break;
        received+=bytes;
    } while (received < total);

    if (received == total)
        perror("ERROR storing complete response from socket");

    close(sockfd);

    printf("Response:\n%s\n", response);

    return 0;
}
