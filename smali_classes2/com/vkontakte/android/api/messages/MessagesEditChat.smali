.class public Lcom/vkontakte/android/api/messages/MessagesEditChat;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "MessagesEditChat.java"


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 2
    .param p1, "chatID"    # I
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 8
    const-string/jumbo v0, "messages.editChat"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 9
    const-string/jumbo v0, "chat_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/messages/MessagesEditChat;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 10
    return-void
.end method
