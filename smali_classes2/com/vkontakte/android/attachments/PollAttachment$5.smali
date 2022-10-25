.class Lcom/vkontakte/android/attachments/PollAttachment$5;
.super Ljava/lang/Object;
.source "PollAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/PollAttachment;->reloadIfNeeded(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/attachments/PollAttachment;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/PollAttachment;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/PollAttachment;

    .prologue
    .line 229
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iput-object p2, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->val$view:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 245
    return-void
.end method

.method public success(Lcom/vkontakte/android/attachments/PollAttachment;)V
    .locals 6
    .param p1, "result"    # Lcom/vkontakte/android/attachments/PollAttachment;

    .prologue
    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v1, p1, Lcom/vkontakte/android/attachments/PollAttachment;->question:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/attachments/PollAttachment;->question:Ljava/lang/String;

    .line 233
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 234
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 235
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget v1, p1, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    iput v1, v0, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget v1, p1, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    iput v1, v0, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-boolean v1, p1, Lcom/vkontakte/android/attachments/PollAttachment;->isAnonymous:Z

    iput-boolean v1, v0, Lcom/vkontakte/android/attachments/PollAttachment;->isAnonymous:Z

    .line 238
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    long-to-int v1, v2

    iput v1, v0, Lcom/vkontakte/android/attachments/PollAttachment;->lastUpdated:I

    .line 239
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->val$view:Landroid/view/View;

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/PollAttachment;->access$500(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/View;)V

    .line 240
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$5;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/PollAttachment;->access$400(Lcom/vkontakte/android/attachments/PollAttachment;)V

    .line 241
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 229
    check-cast p1, Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PollAttachment$5;->success(Lcom/vkontakte/android/attachments/PollAttachment;)V

    return-void
.end method
