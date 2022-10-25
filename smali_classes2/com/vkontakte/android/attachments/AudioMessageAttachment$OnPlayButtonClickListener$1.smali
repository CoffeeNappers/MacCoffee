.class Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "AudioMessageAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/Document;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;Landroid/content/Context;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 232
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;->this$1:Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;

    iput-object p3, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;->val$context:Landroid/content/Context;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 245
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 246
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/Document;)V
    .locals 2
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 235
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;->this$1:Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    iget-object v1, p1, Lcom/vkontakte/android/api/Document;->linkMp3:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$702(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Ljava/lang/String;)Ljava/lang/String;

    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;->this$1:Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    iget-object v1, p1, Lcom/vkontakte/android/api/Document;->linkOgg:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$802(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Ljava/lang/String;)Ljava/lang/String;

    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;->this$1:Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    iget v1, p1, Lcom/vkontakte/android/api/Document;->duration:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$902(Lcom/vkontakte/android/attachments/AudioMessageAttachment;I)I

    .line 238
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;->this$1:Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    iget-object v1, p1, Lcom/vkontakte/android/api/Document;->waveform:[B

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$1002(Lcom/vkontakte/android/attachments/AudioMessageAttachment;[B)[B

    .line 240
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;->this$1:Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->play(Landroid/content/Context;)V

    .line 241
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 232
    check-cast p1, Lcom/vkontakte/android/api/Document;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener$1;->success(Lcom/vkontakte/android/api/Document;)V

    return-void
.end method
