.class final Lcom/vk/stories/view/ShutterButton$3;
.super Landroid/util/Property;
.source "ShutterButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/view/ShutterButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Property",
        "<",
        "Lcom/vk/stories/view/ShutterButton;",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 58
    .local p1, "x0":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Float;>;"
    invoke-direct {p0, p1, p2}, Landroid/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public get(Lcom/vk/stories/view/ShutterButton;)Ljava/lang/Float;
    .locals 1
    .param p1, "object"    # Lcom/vk/stories/view/ShutterButton;

    .prologue
    .line 66
    invoke-virtual {p1}, Lcom/vk/stories/view/ShutterButton;->getRedProgress()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 58
    check-cast p1, Lcom/vk/stories/view/ShutterButton;

    invoke-virtual {p0, p1}, Lcom/vk/stories/view/ShutterButton$3;->get(Lcom/vk/stories/view/ShutterButton;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public set(Lcom/vk/stories/view/ShutterButton;Ljava/lang/Float;)V
    .locals 1
    .param p1, "object"    # Lcom/vk/stories/view/ShutterButton;
    .param p2, "value"    # Ljava/lang/Float;

    .prologue
    .line 61
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vk/stories/view/ShutterButton;->setRedProgress(F)V

    .line 62
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 58
    check-cast p1, Lcom/vk/stories/view/ShutterButton;

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p0, p1, p2}, Lcom/vk/stories/view/ShutterButton$3;->set(Lcom/vk/stories/view/ShutterButton;Ljava/lang/Float;)V

    return-void
.end method
