.class Lcom/vkontakte/android/utils/PostPublisher$1;
.super Ljava/lang/Object;
.source "PostPublisher.java"

# interfaces
.implements Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/utils/PostPublisher;->publishPost(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/utils/PostPublisher;

.field final synthetic val$attachments:[Lcom/vkontakte/android/attachments/Attachment;

.field final synthetic val$counter:Ljava/util/concurrent/atomic/AtomicInteger;

.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$listeners:[Lcom/vkontakte/android/upload/UploadListener;

.field final synthetic val$message:Ljava/lang/CharSequence;

.field final synthetic val$startId:I

.field final synthetic val$uploadTasks:[Lcom/vkontakte/android/upload/PhotoUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/utils/PostPublisher;I[Lcom/vkontakte/android/attachments/Attachment;Ljava/util/concurrent/atomic/AtomicInteger;Landroid/content/Context;Ljava/lang/CharSequence;[Lcom/vkontakte/android/upload/PhotoUploadTask;[Lcom/vkontakte/android/upload/UploadListener;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/utils/PostPublisher;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->this$0:Lcom/vkontakte/android/utils/PostPublisher;

    iput p2, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$startId:I

    iput-object p3, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$attachments:[Lcom/vkontakte/android/attachments/Attachment;

    iput-object p4, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$counter:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p5, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$ctx:Landroid/content/Context;

    iput-object p6, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$message:Ljava/lang/CharSequence;

    iput-object p7, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$uploadTasks:[Lcom/vkontakte/android/upload/PhotoUploadTask;

    iput-object p8, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$listeners:[Lcom/vkontakte/android/upload/UploadListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method end()V
    .locals 4

    .prologue
    .line 154
    iget-object v2, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$listeners:[Lcom/vkontakte/android/upload/UploadListener;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v0, v2, v1

    .line 155
    .local v0, "uploadListener":Lcom/vkontakte/android/upload/UploadListener;
    invoke-virtual {v0}, Lcom/vkontakte/android/upload/UploadListener;->stopListener()V

    .line 154
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 157
    .end local v0    # "uploadListener":Lcom/vkontakte/android/upload/UploadListener;
    :cond_0
    return-void
.end method

.method public onDone(ILcom/vkontakte/android/attachments/Attachment;)V
    .locals 4
    .param p1, "id"    # I
    .param p2, "attachment"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 129
    iget v0, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$startId:I

    if-lt p1, v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$startId:I

    iget-object v1, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$attachments:[Lcom/vkontakte/android/attachments/Attachment;

    array-length v1, v1

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$attachments:[Lcom/vkontakte/android/attachments/Attachment;

    iget v1, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$startId:I

    sub-int v1, p1, v1

    aget-object v0, v0, v1

    if-nez v0, :cond_1

    .line 131
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$attachments:[Lcom/vkontakte/android/attachments/Attachment;

    iget v1, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$startId:I

    sub-int v1, p1, v1

    aput-object p2, v0, v1

    .line 132
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$counter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$counter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_0

    .line 135
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/PostPublisher$1;->end()V

    .line 136
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->this$0:Lcom/vkontakte/android/utils/PostPublisher;

    iget-object v1, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$message:Ljava/lang/CharSequence;

    iget-object v3, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$attachments:[Lcom/vkontakte/android/attachments/Attachment;

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/utils/PostPublisher;->access$000(Lcom/vkontakte/android/utils/PostPublisher;Landroid/content/Context;Ljava/lang/CharSequence;[Lcom/vkontakte/android/attachments/Attachment;)V

    .line 142
    :cond_0
    :goto_0
    return-void

    .line 139
    :cond_1
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/utils/PostPublisher$1;->onFailed(ILcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_0
.end method

.method public onFailed(ILcom/vkontakte/android/attachments/Attachment;)V
    .locals 5
    .param p1, "id"    # I
    .param p2, "attachment"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 146
    iget-object v2, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->val$uploadTasks:[Lcom/vkontakte/android/upload/PhotoUploadTask;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v0, v2, v1

    .line 147
    .local v0, "uploadTask":Lcom/vkontakte/android/upload/PhotoUploadTask;
    invoke-virtual {v0}, Lcom/vkontakte/android/upload/PhotoUploadTask;->getID()I

    move-result v4

    invoke-static {v4}, Lcom/vkontakte/android/upload/Upload;->cancel(I)V

    .line 146
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 149
    .end local v0    # "uploadTask":Lcom/vkontakte/android/upload/PhotoUploadTask;
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/PostPublisher$1;->end()V

    .line 150
    iget-object v1, p0, Lcom/vkontakte/android/utils/PostPublisher$1;->this$0:Lcom/vkontakte/android/utils/PostPublisher;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/PostPublisher;->access$100(Lcom/vkontakte/android/utils/PostPublisher;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 151
    return-void
.end method

.method public onProgress(III)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "done"    # I
    .param p3, "total"    # I

    .prologue
    .line 125
    return-void
.end method
