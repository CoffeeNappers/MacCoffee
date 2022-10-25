.class final Lcom/vk/emoji/FastScroller$1;
.super Landroid/util/Property;
.source "FastScroller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/emoji/FastScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Property",
        "<",
        "Lcom/vk/emoji/FastScroller;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 18
    .local p1, "x0":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Integer;>;"
    invoke-direct {p0, p1, p2}, Landroid/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public get(Lcom/vk/emoji/FastScroller;)Ljava/lang/Integer;
    .locals 1
    .param p1, "object"    # Lcom/vk/emoji/FastScroller;

    .prologue
    .line 26
    invoke-virtual {p1}, Lcom/vk/emoji/FastScroller;->getPaddingBottom()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 18
    check-cast p1, Lcom/vk/emoji/FastScroller;

    invoke-virtual {p0, p1}, Lcom/vk/emoji/FastScroller$1;->get(Lcom/vk/emoji/FastScroller;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public set(Lcom/vk/emoji/FastScroller;Ljava/lang/Integer;)V
    .locals 1
    .param p1, "object"    # Lcom/vk/emoji/FastScroller;
    .param p2, "value"    # Ljava/lang/Integer;

    .prologue
    .line 21
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vk/emoji/FastScroller;->setPaddingBottom(I)V

    .line 22
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 18
    check-cast p1, Lcom/vk/emoji/FastScroller;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2}, Lcom/vk/emoji/FastScroller$1;->set(Lcom/vk/emoji/FastScroller;Ljava/lang/Integer;)V

    return-void
.end method
