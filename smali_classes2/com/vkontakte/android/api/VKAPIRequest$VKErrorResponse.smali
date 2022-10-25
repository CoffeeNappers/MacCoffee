.class public Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
.super Lme/grishka/appkit/api/ErrorResponse;
.source "VKAPIRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/VKAPIRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VKErrorResponse"
.end annotation


# instance fields
.field private final code:I

.field public final description:Ljava/lang/String;

.field public final message:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 415
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 416
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "description"    # Ljava/lang/String;

    .prologue
    .line 418
    invoke-direct {p0}, Lme/grishka/appkit/api/ErrorResponse;-><init>()V

    .line 419
    iput p1, p0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->code:I

    .line 420
    iput-object p2, p0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    .line 421
    iput-object p3, p0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->description:Ljava/lang/String;

    .line 422
    return-void
.end method


# virtual methods
.method public bindErrorView(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 443
    if-eqz p1, :cond_0

    .line 444
    const v0, 0x7f1001a1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->code:I

    iget-object v3, p0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/api/APIUtils;->getLocalizedError(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 445
    const v0, 0x7f1001a2

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0801f7

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 447
    :cond_0
    return-void
.end method

.method public getCode()I
    .locals 1

    .prologue
    .line 429
    iget v0, p0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->code:I

    return v0
.end method

.method public getCodeValue()I
    .locals 1

    .prologue
    .line 433
    iget v0, p0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->code:I

    invoke-static {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->getValueFromErrorCode(I)I

    move-result v0

    return v0
.end method

.method public showToast(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 451
    iget v0, p0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->code:I

    iget-object v1, p0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    .line 452
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 438
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ErrorResponse{message=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\', code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
