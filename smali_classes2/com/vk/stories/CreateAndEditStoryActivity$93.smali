.class Lcom/vk/stories/CreateAndEditStoryActivity$93;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 3004
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private loadAndShow(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 12
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "emoji"    # Z
    .param p3, "metaInfo"    # Ljava/lang/String;

    .prologue
    .line 3007
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v2, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 3008
    .local v2, "handler":Landroid/os/Handler;
    new-instance v4, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v4}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 3009
    .local v4, "dialog":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroid/app/Dialog;>;"
    new-instance v3, Lcom/vk/stories/CreateAndEditStoryActivity$93$1;

    invoke-direct {v3, p0, v4}, Lcom/vk/stories/CreateAndEditStoryActivity$93$1;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$93;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 3017
    .local v3, "dialogShow":Ljava/lang/Runnable;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v0

    .line 3018
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 3019
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v11

    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;

    move-object v1, p0

    move v5, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$93;Landroid/os/Handler;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicReference;ZLjava/lang/String;)V

    new-instance v5, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;

    move-object v6, p0

    move-object v7, v2

    move-object v8, v3

    move-object v9, v4

    move v10, p2

    invoke-direct/range {v5 .. v10}, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$93;Landroid/os/Handler;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicReference;Z)V

    .line 3020
    invoke-virtual {v11, v0, v5}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 3054
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 3064
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$11200(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 3065
    return-void
.end method

.method public onEmojiSelected(Ljava/lang/String;)V
    .locals 2
    .param p1, "emoji"    # Ljava/lang/String;

    .prologue
    .line 3069
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity$93;->loadAndShow(Ljava/lang/String;ZLjava/lang/String;)V

    .line 3070
    return-void
.end method

.method public onMaskSelected(Ljava/lang/String;I)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "id"    # I

    .prologue
    .line 3074
    const/4 v0, 0x1

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity$93;->loadAndShow(Ljava/lang/String;ZLjava/lang/String;)V

    .line 3075
    return-void
.end method

.method public onStickerSelected(IILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "packId"    # I
    .param p2, "stickerId"    # I
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "stickerReferrer"    # Ljava/lang/String;

    .prologue
    .line 3058
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosAddEditorRecentSticker;

    invoke-direct {v0, p2}, Lcom/vkontakte/android/api/photos/PhotosAddEditorRecentSticker;-><init>(I)V

    invoke-virtual {v0}, Lcom/vkontakte/android/api/photos/PhotosAddEditorRecentSticker;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 3059
    const/4 v0, 0x0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p3, v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity$93;->loadAndShow(Ljava/lang/String;ZLjava/lang/String;)V

    .line 3060
    return-void
.end method
