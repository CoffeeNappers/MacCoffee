.class public Lcom/vkontakte/android/api/APIException;
.super Ljava/lang/RuntimeException;
.source "APIException.java"


# instance fields
.field public code:I

.field public descr:Ljava/lang/String;

.field public errorResponse:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 2
    .param p1, "code"    # I
    .param p2, "descr"    # Ljava/lang/String;

    .prologue
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 5
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/api/APIException;->code:I

    .line 11
    iput p1, p0, Lcom/vkontakte/android/api/APIException;->code:I

    .line 12
    iput-object p2, p0, Lcom/vkontakte/android/api/APIException;->descr:Ljava/lang/String;

    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "errorResponse"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 5
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/api/APIException;->code:I

    .line 17
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/APIException;->code:I

    .line 18
    iget-object v0, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->description:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/api/APIException;->descr:Ljava/lang/String;

    .line 19
    iput-object p1, p0, Lcom/vkontakte/android/api/APIException;->errorResponse:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .line 20
    return-void
.end method
