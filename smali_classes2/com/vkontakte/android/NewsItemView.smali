.class public Lcom/vkontakte/android/NewsItemView;
.super Ljava/lang/Object;
.source "NewsItemView.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(ILandroid/view/View;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;Landroid/view/View;I)V
    .locals 0
    .param p0, "x0"    # I
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # Ljava/util/ArrayList;
    .param p3, "x3"    # Lcom/vkontakte/android/NewsEntry;
    .param p4, "x4"    # Landroid/view/View;
    .param p5, "x5"    # I

    .prologue
    .line 28
    invoke-static/range {p0 .. p5}, Lcom/vkontakte/android/NewsItemView;->openPhotoList(ILandroid/view/View;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;Landroid/view/View;I)V

    return-void
.end method

.method public static addAttachments(Landroid/view/View;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;I)V
    .locals 19
    .param p0, "item"    # Landroid/view/View;
    .param p2, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p3, "containerID"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;",
            "Lcom/vkontakte/android/NewsEntry;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/4 v15, 0x0

    .local v15, "pi":I
    const/4 v10, 0x0

    .line 32
    .local v10, "ai":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .local v4, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .local v12, "audios":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v14, 0x0

    .line 35
    .local v14, "nPhotos":I
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/attachments/Attachment;

    .line 36
    .local v11, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v11, Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-eqz v2, :cond_1

    instance-of v2, v11, Lcom/vkontakte/android/attachments/AlbumAttachment;

    if-nez v2, :cond_1

    .line 37
    add-int/lit8 v14, v14, 0x1

    .line 38
    new-instance v6, Lcom/vkontakte/android/Photo;

    move-object v2, v11

    check-cast v2, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-direct {v6, v2}, Lcom/vkontakte/android/Photo;-><init>(Lcom/vkontakte/android/attachments/PhotoAttachment;)V

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    :cond_1
    instance-of v2, v11, Lcom/vkontakte/android/attachments/AudioAttachment;

    if-eqz v2, :cond_2

    move-object v8, v11

    .line 41
    check-cast v8, Lcom/vkontakte/android/attachments/AudioAttachment;

    .line 42
    .local v8, "aa":Lcom/vkontakte/android/attachments/AudioAttachment;
    const-string/jumbo v2, "comments"

    const/4 v6, 0x0

    invoke-virtual {v8, v2, v6}, Lcom/vkontakte/android/attachments/AudioAttachment;->setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 43
    iget-object v2, v8, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v12, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .end local v8    # "aa":Lcom/vkontakte/android/attachments/AudioAttachment;
    :cond_2
    instance-of v2, v11, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v2, :cond_0

    .line 46
    check-cast v11, Lcom/vkontakte/android/attachments/SnippetAttachment;

    .end local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    const/4 v2, 0x0

    invoke-virtual {v11, v2}, Lcom/vkontakte/android/attachments/SnippetAttachment;->setReferData(Lcom/vkontakte/android/data/PostInteract;)V

    goto :goto_0

    .line 49
    :cond_3
    const/16 v16, 0x0

    .line 50
    .local v16, "thumb":Landroid/view/View;
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_4
    :goto_1
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/attachments/Attachment;

    .line 51
    .restart local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    if-eqz v11, :cond_4

    .line 52
    if-eqz p2, :cond_9

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v5, 0x0

    invoke-virtual {v11, v2, v5}, Lcom/vkontakte/android/attachments/Attachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v17

    .line 53
    .local v17, "v":Landroid/view/View;
    :goto_2
    if-lez v14, :cond_5

    instance-of v2, v11, Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-eqz v2, :cond_5

    instance-of v2, v11, Lcom/vkontakte/android/attachments/AlbumAttachment;

    if-nez v2, :cond_5

    .line 54
    move v3, v15

    .line 55
    .local v3, "idx":I
    new-instance v2, Lcom/vkontakte/android/NewsItemView$1;

    move-object/from16 v5, p2

    move-object/from16 v6, p0

    move/from16 v7, p3

    invoke-direct/range {v2 .. v7}, Lcom/vkontakte/android/NewsItemView$1;-><init>(ILjava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;Landroid/view/View;I)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    add-int/lit8 v15, v15, 0x1

    .line 68
    const/4 v2, 0x1

    if-ne v14, v2, :cond_5

    move-object/from16 v2, v17

    .line 69
    check-cast v2, Landroid/widget/ImageView;

    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 72
    .end local v3    # "idx":I
    :cond_5
    instance-of v2, v11, Lcom/vkontakte/android/attachments/AudioAttachment;

    if-eqz v2, :cond_6

    move-object/from16 v9, v17

    .line 73
    check-cast v9, Lcom/vkontakte/android/AudioAttachView;

    .line 74
    .local v9, "aav":Lcom/vkontakte/android/AudioAttachView;
    iput-object v12, v9, Lcom/vkontakte/android/AudioAttachView;->playlist:Ljava/util/ArrayList;

    .line 75
    iput v10, v9, Lcom/vkontakte/android/AudioAttachView;->playlistPos:I

    .line 76
    add-int/lit8 v10, v10, 0x1

    .line 78
    .end local v9    # "aav":Lcom/vkontakte/android/AudioAttachView;
    :cond_6
    instance-of v2, v11, Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v2, :cond_7

    move-object v2, v11

    .line 79
    check-cast v2, Lcom/vkontakte/android/attachments/VideoAttachment;

    const-string/jumbo v5, "comments"

    const/4 v6, 0x0

    invoke-virtual {v2, v5, v6}, Lcom/vkontakte/android/attachments/VideoAttachment;->setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 81
    :cond_7
    instance-of v2, v11, Lcom/vkontakte/android/attachments/ThumbAttachment;

    if-nez v2, :cond_8

    instance-of v2, v11, Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-eqz v2, :cond_a

    check-cast v11, Lcom/vkontakte/android/attachments/DocumentAttachment;

    .end local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v2, v11, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_a

    .line 82
    :cond_8
    move-object/from16 v16, v17

    .line 88
    :goto_3
    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto/16 :goto_1

    .line 52
    .end local v17    # "v":Landroid/view/View;
    .restart local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_9
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v11, v2}, Lcom/vkontakte/android/attachments/Attachment;->getFullView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v17

    goto :goto_2

    .line 84
    .end local v11    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v17    # "v":Landroid/view/View;
    :cond_a
    new-instance v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-direct {v13}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;-><init>()V

    .line 85
    .local v13, "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    const/4 v2, -0x1

    iput v2, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    .line 86
    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_3

    .line 91
    .end local v13    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .end local v17    # "v":Landroid/view/View;
    :cond_b
    if-eqz v16, :cond_c

    .line 92
    invoke-virtual/range {v16 .. v16}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    .line 93
    .restart local v13    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    if-eqz v13, :cond_c

    .line 94
    const/4 v2, 0x1

    iput-boolean v2, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->breakAfter:Z

    .line 95
    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    .end local v13    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_c
    return-void
.end method

.method private static openPhotoList(ILandroid/view/View;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;Landroid/view/View;I)V
    .locals 14
    .param p0, "index"    # I
    .param p1, "view"    # Landroid/view/View;
    .param p3, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p4, "container"    # Landroid/view/View;
    .param p5, "vID"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/view/View;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;",
            "Lcom/vkontakte/android/NewsEntry;",
            "Landroid/view/View;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p2, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    const v7, 0x7f100067

    move-object/from16 v0, p4

    invoke-virtual {v0, v7}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 142
    :goto_0
    return-void

    .line 105
    :cond_0
    invoke-virtual/range {p4 .. p5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 106
    .local v1, "attachContainer":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v7

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    if-ge v2, v7, :cond_2

    .line 107
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 108
    .local v6, "v":Landroid/view/View;
    const/4 v7, 0x2

    new-array v4, v7, [I

    fill-array-data v4, :array_0

    .line 109
    .local v4, "pos":[I
    invoke-virtual {v6, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 110
    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/Photo;

    new-instance v8, Landroid/graphics/Rect;

    const/4 v9, 0x0

    aget v9, v4, v9

    const/4 v10, 0x1

    aget v10, v4, v10

    const/4 v11, 0x0

    aget v11, v4, v11

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v12

    add-int/2addr v11, v12

    const/4 v12, 0x1

    aget v12, v4, v12

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v13

    add-int/2addr v12, v13

    invoke-direct {v8, v9, v10, v11, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v8, v7, Lcom/vkontakte/android/Photo;->viewBounds:Landroid/graphics/Rect;

    .line 111
    invoke-virtual/range {p4 .. p4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    invoke-static {v6, v7}, Lcom/vkontakte/android/ViewUtils;->getViewOffset(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v7

    iget v5, v7, Landroid/graphics/Point;->y:I

    .line 112
    .local v5, "top":I
    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/Photo;

    if-gez v5, :cond_1

    neg-int v8, v5

    :goto_2
    iput v8, v7, Lcom/vkontakte/android/Photo;->viewClipTop:I

    .line 106
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 112
    :cond_1
    const/4 v8, 0x0

    goto :goto_2

    .line 115
    .end local v4    # "pos":[I
    .end local v5    # "top":I
    .end local v6    # "v":Landroid/view/View;
    :cond_2
    new-instance v3, Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v7

    new-instance v8, Lcom/vkontakte/android/NewsItemView$2;

    move-object/from16 v0, p4

    invoke-direct {v8, v0}, Lcom/vkontakte/android/NewsItemView$2;-><init>(Landroid/view/View;)V

    move-object/from16 v0, p2

    invoke-direct {v3, v7, v0, p0, v8}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/util/List;ILcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;)V

    .line 140
    .local v3, "photoViewer":Lcom/vkontakte/android/PhotoViewer;
    const v7, 0x7f100067

    move-object/from16 v0, p4

    invoke-virtual {v0, v7, v3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 141
    invoke-virtual {v3}, Lcom/vkontakte/android/PhotoViewer;->show()V

    goto/16 :goto_0

    .line 108
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method
