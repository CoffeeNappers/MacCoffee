.class final synthetic Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:I

.field private final arg$2:J

.field private final arg$3:Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;


# direct methods
.method private constructor <init>(IJLcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$1;->arg$1:I

    iput-wide p2, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$1;->arg$2:J

    iput-object p4, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$1;->arg$3:Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;

    return-void
.end method

.method public static lambdaFactory$(IJLcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$1;-><init>(IJLcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget v0, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$1;->arg$1:I

    iget-wide v2, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$1;->arg$2:J

    iget-object v1, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$1;->arg$3:Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;

    invoke-static {v0, v2, v3, v1}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lambda$load$2(IJLcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)V

    return-void
.end method
