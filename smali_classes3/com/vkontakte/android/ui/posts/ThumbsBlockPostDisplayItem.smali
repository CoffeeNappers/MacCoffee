.class public Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "ThumbsBlockPostDisplayItem.java"

# interfaces
.implements Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;
    }
.end annotation


# instance fields
.field public all:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/ThumbAttachment;",
            ">;"
        }
    .end annotation
.end field

.field public atts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/ThumbAttachment;",
            ">;"
        }
    .end annotation
.end field

.field private photoViewer:Lcom/vkontakte/android/PhotoViewer;

.field private photoViewerParent:Landroid/view/ViewGroup;

.field public photosMode:Z

.field public post:Lcom/vkontakte/android/NewsEntry;

.field private postInteract:Lcom/vkontakte/android/data/PostInteract;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public referer:Ljava/lang/String;

.field public useBigVideoView:Z


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;Ljava/util/List;ZLjava/lang/String;Ljava/util/List;Lcom/vkontakte/android/data/PostInteract;)V
    .locals 1
    .param p1, "_post"    # Lcom/vkontakte/android/NewsEntry;
    .param p3, "_photosMode"    # Z
    .param p4, "_referer"    # Ljava/lang/String;
    .param p6, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/NewsEntry;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/ThumbAttachment;",
            ">;Z",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/ThumbAttachment;",
            ">;",
            "Lcom/vkontakte/android/data/PostInteract;",
            ")V"
        }
    .end annotation

    .prologue
    .line 54
    .local p2, "_atts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/ThumbAttachment;>;"
    .local p5, "_all":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/ThumbAttachment;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->atts:Ljava/util/ArrayList;

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->useBigVideoView:Z

    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->atts:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 56
    iput-boolean p3, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->photosMode:Z

    .line 57
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    .line 58
    iput-object p4, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->referer:Ljava/lang/String;

    .line 59
    iput-object p5, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->all:Ljava/util/List;

    .line 60
    iput-object p6, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 61
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;)Lcom/vkontakte/android/PhotoViewer;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->photoViewer:Lcom/vkontakte/android/PhotoViewer;

    return-object v0
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 79
    new-instance v1, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$1;-><init>(Landroid/content/Context;)V

    .line 85
    .local v1, "fl":Landroid/widget/FrameLayout;
    new-instance v0, Lcom/vkontakte/android/ui/FlowLayout;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/FlowLayout;-><init>(Landroid/content/Context;)V

    .line 86
    .local v0, "f":Lcom/vkontakte/android/ui/FlowLayout;
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 87
    new-instance v2, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;-><init>(Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$1;)V

    .line 88
    .local v2, "holder":Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;
    iput-object v0, v2, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    .line 89
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    .line 90
    return-object v1
.end method

.method private openPhotoList(ILandroid/view/View;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;Landroid/view/ViewGroup;)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p4, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p5, "attachContainer"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/view/View;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;",
            "Lcom/vkontakte/android/NewsEntry;",
            "Landroid/view/ViewGroup;",
            ")V"
        }
    .end annotation

    .prologue
    .line 229
    .local p3, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->photoViewer:Lcom/vkontakte/android/PhotoViewer;

    if-eqz v1, :cond_0

    .line 265
    :goto_0
    return-void

    .line 232
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    sget-object v2, Lcom/vkontakte/android/data/PostInteract$Type;->open_photo:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 233
    iput-object p5, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->photoViewerParent:Landroid/view/ViewGroup;

    .line 234
    new-instance v1, Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2, p3, p1, p0}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/util/List;ILcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;)V

    iput-object v1, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->photoViewer:Lcom/vkontakte/android/PhotoViewer;

    .line 235
    if-eqz p4, :cond_2

    iget v1, p4, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v2, 0x6

    if-eq v1, v2, :cond_1

    iget v1, p4, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v2, 0x7

    if-eq v1, v2, :cond_1

    iget v1, p4, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v2, 0x9

    if-ne v1, v2, :cond_2

    :cond_1
    iget v1, p4, Lcom/vkontakte/android/NewsEntry;->postID:I

    const/4 v2, 0x5

    if-le v1, v2, :cond_2

    .line 236
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->photoViewer:Lcom/vkontakte/android/PhotoViewer;

    iget v2, p4, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/PhotoViewer;->setDisplayTotal(I)V

    .line 237
    move-object v0, p3

    .line 238
    .local v0, "_photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    new-instance v1, Lcom/vkontakte/android/api/photos/GetFullPhotoList;

    invoke-direct {v1, p4}, Lcom/vkontakte/android/api/photos/GetFullPhotoList;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    new-instance v2, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$2;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, p0, v3, v0}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$2;-><init>(Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;Landroid/content/Context;Ljava/util/ArrayList;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/photos/GetFullPhotoList;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 262
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 264
    .end local v0    # "_photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->photoViewer:Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {v1}, Lcom/vkontakte/android/PhotoViewer;->show()V

    goto :goto_0
.end method


# virtual methods
.method public getAutoPlayItem()Lcom/vkontakte/android/media/AutoPlay;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 216
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->atts:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_1

    .line 217
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->atts:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ThumbAttachment;

    .line 218
    .local v0, "att":Lcom/vkontakte/android/attachments/ThumbAttachment;
    instance-of v1, v0, Lcom/vkontakte/android/media/AutoPlay;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lcom/vkontakte/android/media/AutoPlay;

    invoke-interface {v1}, Lcom/vkontakte/android/media/AutoPlay;->canAutoPlay()Z

    move-result v1

    if-eqz v1, :cond_0

    check-cast v0, Lcom/vkontakte/android/media/AutoPlay;

    .line 220
    .end local v0    # "att":Lcom/vkontakte/android/attachments/ThumbAttachment;
    :goto_0
    return-object v0

    .restart local v0    # "att":Lcom/vkontakte/android/attachments/ThumbAttachment;
    :cond_0
    move-object v0, v2

    .line 218
    goto :goto_0

    .end local v0    # "att":Lcom/vkontakte/android/attachments/ThumbAttachment;
    :cond_1
    move-object v0, v2

    .line 220
    goto :goto_0
.end method

.method public getImageCount()I
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->atts:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->atts:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    invoke-interface {v0}, Lcom/vkontakte/android/attachments/ImageAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 9
    .param p1, "index"    # I
    .param p2, "outRect"    # Landroid/graphics/Rect;
    .param p3, "outClip"    # Landroid/graphics/Rect;

    .prologue
    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 178
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->photoViewerParent:Landroid/view/ViewGroup;

    if-nez v4, :cond_1

    const/4 v3, 0x0

    .line 179
    .local v3, "v":Landroid/view/View;
    :goto_0
    if-nez v3, :cond_2

    .line 196
    :cond_0
    :goto_1
    return-void

    .line 178
    .end local v3    # "v":Landroid/view/View;
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->photoViewerParent:Landroid/view/ViewGroup;

    invoke-virtual {v4, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    goto :goto_0

    .line 182
    .restart local v3    # "v":Landroid/view/View;
    :cond_2
    invoke-virtual {v3}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v4

    const v5, 0x7f10018a

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 183
    .local v0, "list":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 186
    const/4 v4, 0x2

    new-array v1, v4, [I

    fill-array-data v1, :array_0

    .line 187
    .local v1, "loc":[I
    invoke-virtual {v3, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 188
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

    .line 189
    invoke-static {v3, v0}, Lme/grishka/appkit/utils/V;->getViewOffset(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v2

    .line 190
    .local v2, "offset":Landroid/graphics/Point;
    iget v4, v2, Landroid/graphics/Point;->y:I

    if-gez v4, :cond_3

    .line 191
    iget v4, v2, Landroid/graphics/Point;->y:I

    neg-int v4, v4

    iput v4, p3, Landroid/graphics/Rect;->top:I

    .line 193
    :cond_3
    iget v4, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v5

    if-le v4, v5, :cond_0

    .line 194
    iget v4, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v5

    sub-int/2addr v4, v5

    iput v4, p3, Landroid/graphics/Rect;->bottom:I

    goto :goto_1

    .line 186
    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x5

    return v0
.end method

.method public isMoreAvailable()Z
    .locals 1

    .prologue
    .line 200
    const/4 v0, 0x0

    return v0
.end method

.method synthetic lambda$onBindView$0(ILjava/util/ArrayList;Landroid/view/View;Landroid/view/View;)V
    .locals 6
    .param p1, "index"    # I
    .param p2, "photos"    # Ljava/util/ArrayList;
    .param p3, "container"    # Landroid/view/View;
    .param p4, "v"    # Landroid/view/View;

    .prologue
    .line 147
    iget-object v4, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object v5, p3

    check-cast v5, Landroid/view/ViewGroup;

    move-object v0, p0

    move v1, p1

    move-object v2, p4

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->openPhotoList(ILandroid/view/View;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;Landroid/view/ViewGroup;)V

    return-void
.end method

.method public loadMore()V
    .locals 0

    .prologue
    .line 206
    return-void
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 24
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 95
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;

    .line 96
    .local v9, "holder":Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    iget-object v0, v9, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/vkontakte/android/ui/FlowLayout;->getChildCount()I

    move-result v20

    move/from16 v0, v20

    if-ge v10, v0, :cond_2

    .line 97
    iget-object v0, v9, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Lcom/vkontakte/android/ui/FlowLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 98
    .local v5, "att":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v18

    .line 99
    .local v18, "tag":Ljava/lang/Object;
    move-object/from16 v0, v18

    instance-of v0, v0, Ljava/lang/String;

    move/from16 v20, v0

    if-nez v20, :cond_0

    move-object/from16 v0, v18

    instance-of v0, v0, Lcom/vkontakte/android/attachments/AttachmentViewHolder;

    move/from16 v20, v0

    if-eqz v20, :cond_1

    .line 100
    :cond_0
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-static {v5, v0}, Lcom/vkontakte/android/attachments/Attachment;->reuseView(Landroid/view/View;Ljava/lang/String;)V

    .line 96
    :cond_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 104
    .end local v5    # "att":Landroid/view/View;
    .end local v18    # "tag":Ljava/lang/Object;
    :cond_2
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .local v16, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->all:Ljava/util/List;

    move-object/from16 v20, v0

    if-eqz v20, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->all:Ljava/util/List;

    move-object/from16 v20, v0

    :goto_1
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :cond_3
    :goto_2
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_5

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/ThumbAttachment;

    .line 106
    .local v5, "att":Lcom/vkontakte/android/attachments/ThumbAttachment;
    instance-of v0, v5, Lcom/vkontakte/android/attachments/PhotoAttachment;

    move/from16 v21, v0

    if-eqz v21, :cond_3

    instance-of v0, v5, Lcom/vkontakte/android/attachments/AlbumAttachment;

    move/from16 v21, v0

    if-nez v21, :cond_3

    .line 107
    new-instance v21, Lcom/vkontakte/android/Photo;

    check-cast v5, Lcom/vkontakte/android/attachments/PhotoAttachment;

    .end local v5    # "att":Lcom/vkontakte/android/attachments/ThumbAttachment;
    move-object/from16 v0, v21

    invoke-direct {v0, v5}, Lcom/vkontakte/android/Photo;-><init>(Lcom/vkontakte/android/attachments/PhotoAttachment;)V

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 105
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->atts:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    goto :goto_1

    .line 111
    :cond_5
    const/16 v17, 0x0

    .line 112
    .local v17, "statistic":Lcom/vkontakte/android/statistics/Statistic;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :cond_6
    :goto_3
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_7

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/Attachment;

    .line 113
    .local v5, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v5, Lcom/vkontakte/android/statistics/Statistic;

    move/from16 v21, v0

    if-eqz v21, :cond_6

    move-object/from16 v17, v5

    .line 114
    check-cast v17, Lcom/vkontakte/android/statistics/Statistic;

    goto :goto_3

    .line 118
    .end local v5    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_7
    new-instance v14, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v20, -0x2

    const/16 v21, -0x2

    const/16 v22, 0x11

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-direct {v14, v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 119
    .local v14, "lp":Landroid/widget/FrameLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->useBigVideoView:Z

    move/from16 v20, v0

    if-nez v20, :cond_8

    .line 120
    const/high16 v20, 0x40800000    # 4.0f

    invoke-static/range {v20 .. v20}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v20

    move/from16 v0, v20

    iput v0, v14, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 122
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->atts:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_c

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v21

    add-int/lit8 v21, v21, -0x1

    invoke-virtual/range {v20 .. v21}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/attachments/Attachment;

    .line 124
    .local v13, "last":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v13, Lcom/vkontakte/android/attachments/ThumbAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_b

    const/16 v20, 0x0

    :goto_4
    move/from16 v0, v20

    iput v0, v14, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 128
    .end local v13    # "last":Lcom/vkontakte/android/attachments/Attachment;
    :goto_5
    iget-object v0, v9, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Lcom/vkontakte/android/ui/FlowLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 130
    iget-object v0, v9, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/vkontakte/android/ui/FlowLayout;->removeAllViews()V

    .line 131
    const/4 v10, 0x0

    .line 132
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->atts:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_6
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_11

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/ThumbAttachment;

    .line 133
    .local v5, "att":Lcom/vkontakte/android/attachments/ThumbAttachment;
    instance-of v0, v5, Lcom/vkontakte/android/attachments/VideoAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_9

    .line 134
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move/from16 v22, v0

    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v22, "|"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    move/from16 v20, v0

    if-nez v20, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move/from16 v20, v0

    :goto_7
    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v22, "_"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move/from16 v22, v0

    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .local v8, "context":Ljava/lang/String;
    move-object/from16 v19, v5

    .line 136
    check-cast v19, Lcom/vkontakte/android/attachments/VideoAttachment;

    .line 137
    .local v19, "videoAttachment":Lcom/vkontakte/android/attachments/VideoAttachment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->referer:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2, v8}, Lcom/vkontakte/android/attachments/VideoAttachment;->setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;Ljava/lang/String;)V

    .line 138
    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->setStatistic(Lcom/vkontakte/android/statistics/Statistic;)V

    .line 139
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->postOwnerID:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/attachments/VideoAttachment;->setPostOwnerId(I)V

    .line 140
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->postID:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/attachments/VideoAttachment;->setPostId(I)V

    .end local v8    # "context":Ljava/lang/String;
    .end local v19    # "videoAttachment":Lcom/vkontakte/android/attachments/VideoAttachment;
    :cond_9
    move-object/from16 v20, v5

    .line 142
    check-cast v20, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v22

    const/16 v23, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/attachments/Attachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v6

    .line 143
    .local v6, "av":Landroid/view/View;
    instance-of v0, v5, Lcom/vkontakte/android/attachments/PhotoAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_a

    instance-of v0, v5, Lcom/vkontakte/android/attachments/AlbumAttachment;

    move/from16 v20, v0

    if-nez v20, :cond_a

    .line 144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->all:Ljava/util/List;

    move-object/from16 v20, v0

    if-eqz v20, :cond_e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->all:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-interface {v0, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v11

    .line 145
    .local v11, "index":I
    :goto_8
    iget-object v7, v9, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    .line 146
    .local v7, "container":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v20, v0

    const/16 v22, 0xb

    move/from16 v0, v20

    move/from16 v1, v22

    if-eq v0, v1, :cond_f

    .line 147
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-static {v0, v11, v1, v7}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;ILjava/util/ArrayList;Landroid/view/View;)Landroid/view/View$OnClickListener;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    .end local v7    # "container":Landroid/view/View;
    .end local v11    # "index":I
    :cond_a
    :goto_9
    add-int/lit8 v10, v10, 0x1

    .line 154
    invoke-interface {v5}, Lcom/vkontakte/android/attachments/ThumbAttachment;->overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    move-result-object v15

    .line 155
    .local v15, "overridenLayoutParams":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    if-eqz v15, :cond_10

    .line 156
    iget-object v0, v9, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v6, v15}, Lcom/vkontakte/android/ui/FlowLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_6

    .line 124
    .end local v5    # "att":Lcom/vkontakte/android/attachments/ThumbAttachment;
    .end local v6    # "av":Landroid/view/View;
    .end local v15    # "overridenLayoutParams":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .restart local v13    # "last":Lcom/vkontakte/android/attachments/Attachment;
    :cond_b
    const/high16 v20, 0x40400000    # 3.0f

    invoke-static/range {v20 .. v20}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v20

    goto/16 :goto_4

    .line 126
    .end local v13    # "last":Lcom/vkontakte/android/attachments/Attachment;
    :cond_c
    const/16 v20, 0x0

    move/from16 v0, v20

    iput v0, v14, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    goto/16 :goto_5

    .line 134
    .restart local v5    # "att":Lcom/vkontakte/android/attachments/ThumbAttachment;
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    move/from16 v20, v0

    goto/16 :goto_7

    .restart local v6    # "av":Landroid/view/View;
    :cond_e
    move v11, v10

    .line 144
    goto :goto_8

    .line 149
    .restart local v7    # "container":Landroid/view/View;
    .restart local v11    # "index":I
    :cond_f
    const/16 v20, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v6, v0}, Landroid/view/View;->setClickable(Z)V

    goto :goto_9

    .line 158
    .end local v7    # "container":Landroid/view/View;
    .end local v11    # "index":I
    .restart local v15    # "overridenLayoutParams":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_10
    iget-object v0, v9, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/ui/FlowLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_6

    .line 161
    .end local v5    # "att":Lcom/vkontakte/android/attachments/ThumbAttachment;
    .end local v6    # "av":Landroid/view/View;
    .end local v15    # "overridenLayoutParams":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v20, v0

    const/16 v21, 0x6

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v20, v0

    const/16 v21, 0x7

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v20, v0

    const/16 v21, 0x9

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_14

    .line 162
    :cond_12
    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/high16 v23, 0x40800000    # 4.0f

    invoke-static/range {v23 .. v23}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v23

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    move/from16 v4, v23

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 168
    :goto_a
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_b
    iget-object v0, v9, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/vkontakte/android/ui/FlowLayout;->getChildCount()I

    move-result v20

    move/from16 v0, v20

    if-ge v12, v0, :cond_15

    .line 169
    iget-object v0, v9, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$ViewHolder;->flowLayout:Lcom/vkontakte/android/ui/FlowLayout;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Lcom/vkontakte/android/ui/FlowLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 170
    .restart local v6    # "av":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->atts:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v20

    move/from16 v0, v20

    if-le v0, v12, :cond_13

    if-ltz v12, :cond_13

    .line 171
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->atts:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/vkontakte/android/attachments/ImageAttachment;

    move-object/from16 v0, v20

    invoke-interface {v0, v6}, Lcom/vkontakte/android/attachments/ImageAttachment;->bind(Landroid/view/View;)V

    .line 168
    :cond_13
    add-int/lit8 v12, v12, 0x1

    goto :goto_b

    .line 164
    .end local v6    # "av":Landroid/view/View;
    .end local v12    # "j":I
    :cond_14
    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    move/from16 v4, v23

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_a

    .line 174
    .restart local v12    # "j":I
    :cond_15
    return-void
.end method

.method public onDismissed()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 210
    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->photoViewer:Lcom/vkontakte/android/PhotoViewer;

    .line 211
    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->photoViewerParent:Landroid/view/ViewGroup;

    .line 212
    return-void
.end method
