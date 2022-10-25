.class final synthetic Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final arg$1:Lcom/vk/attachpicker/screen/EditorScreen$12;

.field private final arg$2:Landroid/os/Handler;

.field private final arg$3:Ljava/lang/Runnable;

.field private final arg$4:Ljava/util/concurrent/atomic/AtomicReference;

.field private final arg$5:Z

.field private final arg$6:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/vk/attachpicker/screen/EditorScreen$12;Landroid/os/Handler;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicReference;ZLjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$1:Lcom/vk/attachpicker/screen/EditorScreen$12;

    iput-object p2, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$2:Landroid/os/Handler;

    iput-object p3, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$3:Ljava/lang/Runnable;

    iput-object p4, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$4:Ljava/util/concurrent/atomic/AtomicReference;

    iput-boolean p5, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$5:Z

    iput-object p6, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$6:Ljava/lang/String;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen$12;Landroid/os/Handler;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicReference;ZLjava/lang/String;)Lio/reactivex/functions/Consumer;
    .locals 7

    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;-><init>(Lcom/vk/attachpicker/screen/EditorScreen$12;Landroid/os/Handler;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicReference;ZLjava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 7
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$1:Lcom/vk/attachpicker/screen/EditorScreen$12;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$2:Landroid/os/Handler;

    iget-object v2, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$3:Ljava/lang/Runnable;

    iget-object v3, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$4:Ljava/util/concurrent/atomic/AtomicReference;

    iget-boolean v4, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$5:Z

    iget-object v5, p0, Lcom/vk/attachpicker/screen/EditorScreen$12$$Lambda$2;->arg$6:Ljava/lang/String;

    move-object v6, p1

    check-cast v6, Landroid/graphics/Bitmap;

    invoke-virtual/range {v0 .. v6}, Lcom/vk/attachpicker/screen/EditorScreen$12;->lambda$loadAndShow$1(Landroid/os/Handler;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicReference;ZLjava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method
