.class final Lcom/vk/stories/view/StoryCircleImageView$1;
.super Landroid/util/Property;
.source "StoryCircleImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/view/StoryCircleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Property",
        "<",
        "Lcom/vk/stories/view/StoryCircleImageView;",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 30
    .local p1, "x0":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Float;>;"
    invoke-direct {p0, p1, p2}, Landroid/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public get(Lcom/vk/stories/view/StoryCircleImageView;)Ljava/lang/Float;
    .locals 1
    .param p1, "object"    # Lcom/vk/stories/view/StoryCircleImageView;

    .prologue
    .line 38
    invoke-virtual {p1}, Lcom/vk/stories/view/StoryCircleImageView;->getSelectionAmount()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 30
    check-cast p1, Lcom/vk/stories/view/StoryCircleImageView;

    invoke-virtual {p0, p1}, Lcom/vk/stories/view/StoryCircleImageView$1;->get(Lcom/vk/stories/view/StoryCircleImageView;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public set(Lcom/vk/stories/view/StoryCircleImageView;Ljava/lang/Float;)V
    .locals 1
    .param p1, "object"    # Lcom/vk/stories/view/StoryCircleImageView;
    .param p2, "value"    # Ljava/lang/Float;

    .prologue
    .line 33
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vk/stories/view/StoryCircleImageView;->setSelectionAmount(F)V

    .line 34
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 30
    check-cast p1, Lcom/vk/stories/view/StoryCircleImageView;

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p0, p1, p2}, Lcom/vk/stories/view/StoryCircleImageView$1;->set(Lcom/vk/stories/view/StoryCircleImageView;Ljava/lang/Float;)V

    return-void
.end method
