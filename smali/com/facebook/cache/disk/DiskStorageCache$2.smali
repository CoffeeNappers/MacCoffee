.class Lcom/facebook/cache/disk/DiskStorageCache$2;
.super Ljava/lang/Object;
.source "DiskStorageCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/cache/disk/DiskStorageCache;-><init>(Lcom/facebook/cache/disk/DiskStorage;Lcom/facebook/cache/disk/EntryEvictionComparatorSupplier;Lcom/facebook/cache/disk/DiskStorageCache$Params;Lcom/facebook/cache/common/CacheEventListener;Lcom/facebook/cache/common/CacheErrorLogger;Lcom/facebook/common/disk/DiskTrimmableRegistry;Landroid/content/Context;Ljava/util/concurrent/Executor;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/cache/disk/DiskStorageCache;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/facebook/cache/disk/DiskStorageCache;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/cache/disk/DiskStorageCache;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/facebook/cache/disk/DiskStorageCache$2;->this$0:Lcom/facebook/cache/disk/DiskStorageCache;

    iput-object p2, p0, Lcom/facebook/cache/disk/DiskStorageCache$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 213
    iget-object v0, p0, Lcom/facebook/cache/disk/DiskStorageCache$2;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/facebook/cache/disk/DiskStorageCache$2;->this$0:Lcom/facebook/cache/disk/DiskStorageCache;

    invoke-static {v1}, Lcom/facebook/cache/disk/DiskStorageCache;->access$300(Lcom/facebook/cache/disk/DiskStorageCache;)Lcom/facebook/cache/disk/DiskStorage;

    move-result-object v1

    invoke-interface {v1}, Lcom/facebook/cache/disk/DiskStorage;->getStorageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/facebook/cache/disk/DiskStorageCache;->access$400(Landroid/content/Context;Ljava/lang/String;)V

    .line 214
    return-void
.end method
