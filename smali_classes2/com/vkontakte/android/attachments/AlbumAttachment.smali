.class public Lcom/vkontakte/android/attachments/AlbumAttachment;
.super Lcom/vkontakte/android/attachments/PhotoAttachment;
.source "AlbumAttachment.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/AlbumAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public size:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 125
    new-instance v0, Lcom/vkontakte/android/attachments/AlbumAttachment$3;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/AlbumAttachment$3;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/AlbumAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/util/HashMap;IIILjava/lang/String;I)V
    .locals 0
    .param p2, "_oid"    # I
    .param p3, "_pid"    # I
    .param p4, "_aid"    # I
    .param p5, "_descr"    # Ljava/lang/String;
    .param p6, "_size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/attachments/PhotoAttachment$Image;",
            ">;III",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "_images":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/vkontakte/android/attachments/PhotoAttachment$Image;>;"
    invoke-direct/range {p0 .. p5}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Ljava/util/HashMap;IIILjava/lang/String;)V

    .line 31
    iput p6, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->size:I

    .line 32
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/AlbumAttachment;->fillEmptyImages()V

    .line 33
    return-void
.end method

.method public constructor <init>([Lcom/vkontakte/android/attachments/PhotoAttachment$Image;IIILjava/lang/String;I)V
    .locals 16
    .param p1, "_images"    # [Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    .param p2, "_oid"    # I
    .param p3, "_pid"    # I
    .param p4, "_aid"    # I
    .param p5, "_descr"    # Ljava/lang/String;
    .param p6, "_size"    # I

    .prologue
    .line 36
    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string/jumbo v10, ""

    const/4 v11, 0x0

    const-wide v12, -0x3f3e6c0000000000L    # -9000.0

    const-wide v14, -0x3f3e6c0000000000L    # -9000.0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move-object/from16 v7, p5

    invoke-direct/range {v2 .. v15}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>([Lcom/vkontakte/android/attachments/PhotoAttachment$Image;IIILjava/lang/String;IILjava/lang/String;IDD)V

    .line 37
    move/from16 v0, p6

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/attachments/AlbumAttachment;->size:I

    .line 38
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/attachments/AlbumAttachment;->fillEmptyImages()V

    .line 39
    return-void
.end method

.method private fillEmptyImages()V
    .locals 3

    .prologue
    .line 42
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    .line 43
    .local v0, "image":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    if-eqz v0, :cond_0

    iget v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    if-nez v1, :cond_0

    iget v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    if-nez v1, :cond_0

    iget-object v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    const-string/jumbo v2, ".gif"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 44
    const/16 v1, 0x1b0

    iput v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    .line 45
    const/16 v1, 0xf9

    iput v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    .line 46
    iget v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    iput v1, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->displayW:I

    .line 47
    iget v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    iput v1, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->displayH:I

    .line 48
    iget v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    int-to-float v1, v1

    iget v2, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    iput v1, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->ratio:F

    .line 50
    :cond_0
    return-void
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 147
    const v0, 0x7f10000c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/AlbumAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 148
    return-void
.end method

.method public getRatio()F
    .locals 1

    .prologue
    .line 54
    const/high16 v0, 0x3fc00000    # 1.5f

    return v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    const v10, 0x7f10000c

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 59
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 60
    .local v0, "iv":Landroid/view/View;
    new-instance v2, Lcom/vkontakte/android/attachments/AlbumAttachment$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/attachments/AlbumAttachment$1;-><init>(Lcom/vkontakte/android/attachments/AlbumAttachment;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    invoke-virtual {v0, v10}, Landroid/view/View;->setId(I)V

    .line 78
    const-string/jumbo v2, "album"

    invoke-static {p1, v2}, Lcom/vkontakte/android/attachments/Attachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 79
    .local v1, "view":Landroid/view/View;
    const v2, 0x7f1001dc

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->descr:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    const v2, 0x7f1001dd

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0044

    iget v5, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->size:I

    new-array v6, v9, [Ljava/lang/Object;

    iget v7, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->size:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    const v2, 0x7f1001de

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const-string/jumbo v3, "%,d"

    new-array v4, v9, [Ljava/lang/Object;

    iget v5, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->size:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move-object v2, v1

    .line 82
    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_0

    move-object v2, v1

    .line 83
    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->removeViewAt(I)V

    :cond_0
    move-object v2, v1

    .line 85
    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v0, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    move-object v2, v1

    .line 86
    check-cast v2, Lcom/vkontakte/android/ui/FixedSizeFrameLayout;

    iget v3, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->displayW:I

    iget v4, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->displayH:I

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/ui/FixedSizeFrameLayout;->setSize(II)V

    .line 88
    invoke-virtual {v1, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const v4, -0xd0d0e

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 90
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/attachments/AlbumAttachment$2;

    invoke-direct {v3, p0, v1}, Lcom/vkontakte/android/attachments/AlbumAttachment$2;-><init>(Lcom/vkontakte/android/attachments/AlbumAttachment;Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 104
    return-object v1
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 5
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 109
    iget-object v3, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->images:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 110
    .local v2, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 111
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 112
    .local v1, "k":Ljava/lang/String;
    iget-object v4, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->images:Ljava/util/HashMap;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    .line 113
    .local v0, "im":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {p1, v4}, Lcom/vkontakte/android/utils/Serializer;->writeChar(C)V

    .line 114
    iget-object v4, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 115
    iget v4, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    invoke-virtual {p1, v4}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 116
    iget v4, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    invoke-virtual {p1, v4}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    goto :goto_0

    .line 118
    .end local v0    # "im":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    .end local v1    # "k":Ljava/lang/String;
    :cond_0
    iget v3, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->oid:I

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 119
    iget v3, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->pid:I

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 120
    iget v3, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->aid:I

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 121
    iget-object v3, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->descr:Ljava/lang/String;

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 122
    iget v3, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->size:I

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 123
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "album"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->oid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/AlbumAttachment;->aid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
