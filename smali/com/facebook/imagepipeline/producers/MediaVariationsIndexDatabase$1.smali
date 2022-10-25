.class Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$1;
.super Ljava/lang/Object;
.source "MediaVariationsIndexDatabase.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->getCachedVariants(Ljava/lang/String;)Lbolts/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/facebook/imagepipeline/request/MediaVariations$Variant;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;

.field final synthetic val$mediaId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$1;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$1;->val$mediaId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$1;->call()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/imagepipeline/request/MediaVariations$Variant;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$1;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;

    iget-object v1, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$1;->val$mediaId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->access$100(Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
