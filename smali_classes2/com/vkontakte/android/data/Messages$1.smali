.class final Lcom/vkontakte/android/data/Messages$1;
.super Ljava/lang/Object;
.source "Messages.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$res:[I


# direct methods
.method constructor <init>([I)V
    .locals 0

    .prologue
    .line 201
    iput-object p1, p0, Lcom/vkontakte/android/data/Messages$1;->val$res:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 209
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "Error getting unread count"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    return-void
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "count"    # Ljava/lang/Integer;

    .prologue
    .line 204
    iget-object v0, p0, Lcom/vkontakte/android/data/Messages$1;->val$res:[I

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput v2, v0, v1

    .line 205
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 201
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/Messages$1;->success(Ljava/lang/Integer;)V

    return-void
.end method
