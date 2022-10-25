.class public Lcom/tonicartos/superslim/LayoutManager$Builder;
.super Ljava/lang/Object;
.source "LayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tonicartos/superslim/LayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field final context:Landroid/content/Context;

.field slms:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/tonicartos/superslim/SectionLayoutManager;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1720
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1718
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tonicartos/superslim/LayoutManager$Builder;->slms:Ljava/util/HashMap;

    .line 1721
    iput-object p1, p0, Lcom/tonicartos/superslim/LayoutManager$Builder;->context:Landroid/content/Context;

    .line 1722
    return-void
.end method


# virtual methods
.method public addSlm(Ljava/lang/String;Lcom/tonicartos/superslim/SectionLayoutManager;)Lcom/tonicartos/superslim/LayoutManager$Builder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "slm"    # Lcom/tonicartos/superslim/SectionLayoutManager;

    .prologue
    .line 1725
    iget-object v0, p0, Lcom/tonicartos/superslim/LayoutManager$Builder;->slms:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1726
    return-object p0
.end method

.method public build()Lcom/tonicartos/superslim/LayoutManager;
    .locals 1

    .prologue
    .line 1730
    new-instance v0, Lcom/tonicartos/superslim/LayoutManager;

    invoke-direct {v0, p0}, Lcom/tonicartos/superslim/LayoutManager;-><init>(Lcom/tonicartos/superslim/LayoutManager$Builder;)V

    return-object v0
.end method
