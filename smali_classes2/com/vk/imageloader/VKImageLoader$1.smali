.class final Lcom/vk/imageloader/VKImageLoader$1;
.super Ljava/lang/Object;
.source "VKImageLoader.java"

# interfaces
.implements Lcom/facebook/common/soloader/SoLoaderShim$Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/imageloader/VKImageLoader;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/vk/imageloader/VKImageLoader$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public loadLibrary(Ljava/lang/String;)V
    .locals 3
    .param p1, "libraryName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 74
    iget-object v0, p0, Lcom/vk/imageloader/VKImageLoader$1;->val$context:Landroid/content/Context;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    aput-object p1, v1, v2

    invoke-static {v0, v2, v1}, Lcom/vk/core/util/LibraryLoader;->loadLibraries(Landroid/content/Context;Z[Ljava/lang/String;)V

    .line 75
    return-void
.end method
