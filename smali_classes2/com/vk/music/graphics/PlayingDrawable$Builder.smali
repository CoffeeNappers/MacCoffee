.class public Lcom/vk/music/graphics/PlayingDrawable$Builder;
.super Ljava/lang/Object;
.source "PlayingDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/graphics/PlayingDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private count:I

.field private gapWidth:I

.field private rectColor:I

.field private rectCornerRadius:I

.field private rectHeight:I

.field private rectMinHeight:I

.field private rectWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/graphics/PlayingDrawable$Builder;

    .prologue
    .line 33
    iget v0, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->count:I

    return v0
.end method

.method static synthetic access$200(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/graphics/PlayingDrawable$Builder;

    .prologue
    .line 33
    iget v0, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectWidth:I

    return v0
.end method

.method static synthetic access$300(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/graphics/PlayingDrawable$Builder;

    .prologue
    .line 33
    iget v0, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectHeight:I

    return v0
.end method

.method static synthetic access$400(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/graphics/PlayingDrawable$Builder;

    .prologue
    .line 33
    iget v0, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectMinHeight:I

    return v0
.end method

.method static synthetic access$500(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/graphics/PlayingDrawable$Builder;

    .prologue
    .line 33
    iget v0, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->gapWidth:I

    return v0
.end method

.method static synthetic access$600(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/graphics/PlayingDrawable$Builder;

    .prologue
    .line 33
    iget v0, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectCornerRadius:I

    return v0
.end method

.method static synthetic access$700(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/graphics/PlayingDrawable$Builder;

    .prologue
    .line 33
    iget v0, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectColor:I

    return v0
.end method


# virtual methods
.method public build()Lcom/vk/music/graphics/PlayingDrawable;
    .locals 2

    .prologue
    .line 79
    new-instance v0, Lcom/vk/music/graphics/PlayingDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vk/music/graphics/PlayingDrawable;-><init>(Lcom/vk/music/graphics/PlayingDrawable$Builder;Lcom/vk/music/graphics/PlayingDrawable$1;)V

    return-object v0
.end method

.method public count(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 44
    iput p1, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->count:I

    .line 45
    return-object p0
.end method

.method public gapWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 64
    iput p1, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->gapWidth:I

    .line 65
    return-object p0
.end method

.method public rectColor(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 74
    iput p1, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectColor:I

    .line 75
    return-object p0
.end method

.method public rectCornerRadius(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 69
    iput p1, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectCornerRadius:I

    .line 70
    return-object p0
.end method

.method public rectHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 54
    iput p1, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectHeight:I

    .line 55
    return-object p0
.end method

.method public rectMinHeight(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 59
    iput p1, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectMinHeight:I

    .line 60
    return-object p0
.end method

.method public rectWidth(I)Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 49
    iput p1, p0, Lcom/vk/music/graphics/PlayingDrawable$Builder;->rectWidth:I

    .line 50
    return-object p0
.end method
