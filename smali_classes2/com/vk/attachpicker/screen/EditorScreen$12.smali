.class Lcom/vk/attachpicker/screen/EditorScreen$12;
.super Ljava/lang/Object;
.source "EditorScreen.java"

# interfaces
.implements Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/EditorScreen;->onStickerClick()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/screen/EditorScreen;

.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/EditorScreen;Landroid/app/Activity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 957
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    iput-object p2, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$loadAndShow$0(Ljava/util/concurrent/atomic/AtomicReference;Landroid/app/Activity;)V
    .locals 1
    .param p0, "dialog"    # Ljava/util/concurrent/atomic/AtomicReference;
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 963
    const v0, 0x7f0804d1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/vk/attachpicker/widget/LoadingDialog;->getInstance(Landroid/content/Context;Ljava/lang/Integer;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 964
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 965
    return-void
.end method

.method static synthetic lambda$loadAndShow$2(Landroid/app/Activity;Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 989
    const v0, 0x7f0804d3

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 990
    return-void
.end method

.method private loadAndShow(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 7
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "emoji"    # Z
    .param p3, "metaInfo"    # Ljava/lang/String;

    .prologue
    .line 960
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 961
    .local v1, "handler":Landroid/os/Handler;
    new-instance v3, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 962
    .local v3, "dialog":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroid/app/Dialog;>;"
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->val$activity:Landroid/app/Activity;

    invoke-static {v3, v0}, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$1;->lambdaFactory$(Ljava/util/concurrent/atomic/AtomicReference;Landroid/app/Activity;)Ljava/lang/Runnable;

    move-result-object v2

    .line 967
    .local v2, "dialogShow":Ljava/lang/Runnable;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v0

    .line 968
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v4

    invoke-virtual {v0, v4}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 969
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v4

    invoke-virtual {v0, v4}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v6

    move-object v0, p0

    move v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen$12;Landroid/os/Handler;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicReference;ZLjava/lang/String;)Lio/reactivex/functions/Consumer;

    move-result-object v0

    iget-object v4, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->val$activity:Landroid/app/Activity;

    invoke-static {v4}, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$3;->lambdaFactory$(Landroid/app/Activity;)Lio/reactivex/functions/Consumer;

    move-result-object v4

    .line 970
    invoke-virtual {v6, v0, v4}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 991
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 1001
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$1800(Lcom/vk/attachpicker/screen/EditorScreen;)V

    .line 1002
    return-void
.end method

.method synthetic lambda$loadAndShow$1(Landroid/os/Handler;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicReference;ZLjava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 4
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "dialogShow"    # Ljava/lang/Runnable;
    .param p3, "dialog"    # Ljava/util/concurrent/atomic/AtomicReference;
    .param p4, "emoji"    # Z
    .param p5, "metaInfo"    # Ljava/lang/String;
    .param p6, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 971
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 972
    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Dialog;

    invoke-static {v1}, Lcom/vk/attachpicker/widget/LoadingDialog;->dismissLoadingDialog(Landroid/app/Dialog;)V

    .line 973
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$1800(Lcom/vk/attachpicker/screen/EditorScreen;)V

    .line 974
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$1900(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getMeasuredWidth()I

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    .line 975
    invoke-static {v2}, Lcom/vk/attachpicker/screen/EditorScreen;->access$1900(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getMeasuredHeight()I

    move-result v2

    .line 974
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 976
    .local v0, "maxWidth":I
    if-eqz p4, :cond_0

    .line 977
    div-int/lit8 v0, v0, 0x2

    .line 979
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$1900(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v1

    new-instance v2, Lcom/vk/attachpicker/stickers/BitmapSticker;

    invoke-direct {v2, p6, v0, p5}, Lcom/vk/attachpicker/stickers/BitmapSticker;-><init>(Landroid/graphics/Bitmap;ILjava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->addStickerView(Lcom/vk/attachpicker/stickers/Sticker;)V

    .line 981
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$2000(Lcom/vk/attachpicker/screen/EditorScreen;)V

    .line 983
    if-eqz p4, :cond_1

    .line 984
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v1, v3}, Lcom/vk/attachpicker/screen/EditorScreen;->access$2100(Lcom/vk/attachpicker/screen/EditorScreen;Z)V

    .line 988
    :goto_0
    return-void

    .line 986
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$12;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v1, v3}, Lcom/vk/attachpicker/screen/EditorScreen;->access$2200(Lcom/vk/attachpicker/screen/EditorScreen;Z)V

    goto :goto_0
.end method

.method public onEmojiSelected(Ljava/lang/String;)V
    .locals 2
    .param p1, "emoji"    # Ljava/lang/String;

    .prologue
    .line 1006
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen$12;->loadAndShow(Ljava/lang/String;ZLjava/lang/String;)V

    .line 1007
    return-void
.end method

.method public onMaskSelected(Ljava/lang/String;I)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "id"    # I

    .prologue
    .line 1011
    const/4 v0, 0x1

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen$12;->loadAndShow(Ljava/lang/String;ZLjava/lang/String;)V

    .line 1012
    return-void
.end method

.method public onStickerSelected(IILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "packId"    # I
    .param p2, "stickerId"    # I
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "stickerReferrer"    # Ljava/lang/String;

    .prologue
    .line 995
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosAddEditorRecentSticker;

    invoke-direct {v0, p2}, Lcom/vkontakte/android/api/photos/PhotosAddEditorRecentSticker;-><init>(I)V

    invoke-virtual {v0}, Lcom/vkontakte/android/api/photos/PhotosAddEditorRecentSticker;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 996
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

    invoke-direct {p0, p3, v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen$12;->loadAndShow(Ljava/lang/String;ZLjava/lang/String;)V

    .line 997
    return-void
.end method
