.class Lcom/vk/imageloader/view/VKImageView$ReflectionHolder;
.super Ljava/lang/Object;
.source "VKImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/imageloader/view/VKImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ReflectionHolder"
.end annotation


# static fields
.field public static submitRequestMethod:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 276
    :try_start_0
    const-class v1, Lcom/facebook/drawee/controller/AbstractDraweeController;

    const-string/jumbo v2, "submitRequest"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/vk/imageloader/view/VKImageView$ReflectionHolder;->submitRequestMethod:Ljava/lang/reflect/Method;

    .line 277
    sget-object v1, Lcom/vk/imageloader/view/VKImageView$ReflectionHolder;->submitRequestMethod:Ljava/lang/reflect/Method;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 281
    return-void

    .line 278
    :catch_0
    move-exception v0

    .line 279
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "Can\'t find submitRequest method in AbstractDraweeController"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 270
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static submitRequest(Lcom/facebook/drawee/interfaces/DraweeController;)V
    .locals 3
    .param p0, "draweeController"    # Lcom/facebook/drawee/interfaces/DraweeController;

    .prologue
    .line 285
    :try_start_0
    sget-object v1, Lcom/vk/imageloader/view/VKImageView$ReflectionHolder;->submitRequestMethod:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    return-void

    .line 286
    :catch_0
    move-exception v0

    .line 287
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "Can\'t invoke submitRequest method in AbstractDraweeController"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
