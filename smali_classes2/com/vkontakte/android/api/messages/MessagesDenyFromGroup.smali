.class public Lcom/vkontakte/android/api/messages/MessagesDenyFromGroup;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "MessagesDenyFromGroup.java"


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "groupId"    # I

    .prologue
    .line 8
    const-string/jumbo v0, "messages.denyMessagesFromGroup"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 9
    const-string/jumbo v0, "group_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/messages/MessagesDenyFromGroup;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 10
    return-void
.end method
