.class Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$1;
.super Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallbackAdapter;
.source "ChatMessageHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lambda$processAttachments$0(Ljava/util/ArrayList;ILandroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    .prologue
    .line 346
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallbackAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 9
    .param p1, "index"    # I
    .param p2, "outRect"    # Landroid/graphics/Rect;
    .param p3, "outClip"    # Landroid/graphics/Rect;

    .prologue
    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 349
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    iget-object v4, v4, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    invoke-virtual {v4, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 350
    .local v3, "v":Landroid/view/View;
    if-nez v3, :cond_1

    .line 366
    :cond_0
    :goto_0
    return-void

    .line 353
    :cond_1
    const/4 v4, 0x2

    new-array v1, v4, [I

    fill-array-data v1, :array_0

    .line 354
    .local v1, "loc":[I
    invoke-virtual {v3, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 355
    aget v4, v1, v6

    aget v5, v1, v8

    aget v6, v1, v6

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v7

    add-int/2addr v6, v7

    aget v7, v1, v8

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p2, v4, v5, v6, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 356
    invoke-virtual {v3}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v4

    const v5, 0x7f10018a

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 357
    .local v0, "list":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 358
    invoke-static {v3, v0}, Lme/grishka/appkit/utils/V;->getViewOffset(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v2

    .line 359
    .local v2, "offset":Landroid/graphics/Point;
    iget v4, v2, Landroid/graphics/Point;->y:I

    if-gez v4, :cond_2

    .line 360
    iget v4, v2, Landroid/graphics/Point;->y:I

    neg-int v4, v4

    iput v4, p3, Landroid/graphics/Rect;->top:I

    .line 362
    :cond_2
    iget v4, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v5

    if-le v4, v5, :cond_0

    .line 363
    iget v4, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v5

    sub-int/2addr v4, v5

    iput v4, p3, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    .line 353
    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public onDismissed()V
    .locals 3

    .prologue
    .line 370
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    const v1, 0x7f100067

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 371
    return-void
.end method
