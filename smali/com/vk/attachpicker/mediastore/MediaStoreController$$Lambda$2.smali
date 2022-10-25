.class final synthetic Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:I

.field private final arg$2:Ljava/util/ArrayList;

.field private final arg$3:Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;

.field private final arg$4:Ljava/util/ArrayList;


# direct methods
.method private constructor <init>(ILjava/util/ArrayList;Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;Ljava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;->arg$1:I

    iput-object p2, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;->arg$2:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;->arg$3:Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;

    iput-object p4, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;->arg$4:Ljava/util/ArrayList;

    return-void
.end method

.method public static lambdaFactory$(ILjava/util/ArrayList;Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;Ljava/util/ArrayList;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;-><init>(ILjava/util/ArrayList;Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;Ljava/util/ArrayList;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget v0, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;->arg$1:I

    iget-object v1, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;->arg$2:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;->arg$3:Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;

    iget-object v3, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;->arg$4:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2, v3}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lambda$null$1(ILjava/util/ArrayList;Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;Ljava/util/ArrayList;)V

    return-void
.end method
