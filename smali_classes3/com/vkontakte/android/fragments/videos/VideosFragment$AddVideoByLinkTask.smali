.class Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;
.super Lcom/vkontakte/android/background/AsyncTask;
.source "VideosFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/videos/VideosFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AddVideoByLinkTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/background/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/vkontakte/android/api/video/VideoSave$Result;",
        ">;"
    }
.end annotation


# instance fields
.field private final mLink:Ljava/lang/String;

.field private final mProgressDialog:Landroid/app/ProgressDialog;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/videos/VideosFragment;Ljava/lang/String;)V
    .locals 2
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/videos/VideosFragment;
    .param p2, "link"    # Ljava/lang/String;

    .prologue
    .line 352
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/background/AsyncTask;-><init>()V

    .line 353
    iput-object p2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->mLink:Ljava/lang/String;

    .line 354
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 355
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->mProgressDialog:Landroid/app/ProgressDialog;

    const v1, 0x7f08033d

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 356
    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;

    .prologue
    .line 347
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/vkontakte/android/api/video/VideoSave$Result;
    .locals 10
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 366
    new-instance v0, Lcom/vkontakte/android/api/video/VideoSave;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    iget-object v6, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->mLink:Ljava/lang/String;

    move-object v4, v3

    move v5, v2

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/api/video/VideoSave;-><init>(IILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    invoke-virtual {v0}, Lcom/vkontakte/android/api/video/VideoSave;->execSyncWithResult()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/api/video/VideoSave$Result;

    .line 368
    .local v9, "results":Lcom/vkontakte/android/api/video/VideoSave$Result;
    iget-object v0, v9, Lcom/vkontakte/android/api/video/VideoSave$Result;->uploadUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/vk/core/network/Network;->getURL(Ljava/lang/String;)[B

    move-result-object v7

    .line 370
    .local v7, "bytes":[B
    new-instance v8, Lorg/json/JSONObject;

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v7}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v8, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 371
    .local v8, "jo":Lorg/json/JSONObject;
    const-string/jumbo v0, "response"

    invoke-virtual {v8, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 372
    const-string/jumbo v0, "error_code"

    invoke-virtual {v8, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    .line 373
    new-instance v0, Ljava/net/MalformedURLException;

    const-string/jumbo v1, "error_message"

    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 375
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    const-string/jumbo v1, "error_message"

    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 378
    :cond_1
    return-object v9
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 347
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->doInBackground([Ljava/lang/Void;)Lcom/vkontakte/android/api/video/VideoSave$Result;

    move-result-object v0

    return-object v0
.end method

.method protected onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 388
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 389
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    instance-of v0, p1, Ljava/net/MalformedURLException;

    if-eqz v0, :cond_1

    const v0, 0x7f08076d

    :goto_0
    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 391
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V

    .line 392
    return-void

    .line 389
    :cond_1
    const v0, 0x7f0801f9

    goto :goto_0
.end method

.method protected onPostExecute(Lcom/vkontakte/android/api/video/VideoSave$Result;)V
    .locals 2
    .param p1, "results"    # Lcom/vkontakte/android/api/video/VideoSave$Result;

    .prologue
    .line 383
    iget v0, p1, Lcom/vkontakte/android/api/video/VideoSave$Result;->id:I

    iget-object v1, p1, Lcom/vkontakte/android/api/video/VideoSave$Result;->accessKey:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->syncVideoEmbedWithServer(ILjava/lang/String;)V

    .line 384
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 347
    check-cast p1, Lcom/vkontakte/android/api/video/VideoSave$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->onPostExecute(Lcom/vkontakte/android/api/video/VideoSave$Result;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 1

    .prologue
    .line 360
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 361
    return-void
.end method

.method syncVideoEmbedWithServer(ILjava/lang/String;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "access_key"    # Ljava/lang/String;

    .prologue
    .line 397
    new-instance v0, Lcom/vkontakte/android/api/video/VideoGetById;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    invoke-direct {v0, v1, p1, p2}, Lcom/vkontakte/android/api/video/VideoGetById;-><init>(IILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask$1;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1, p2}, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask$1;-><init>(Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;Landroid/content/Context;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    .line 414
    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 415
    return-void
.end method
