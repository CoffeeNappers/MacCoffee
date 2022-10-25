.class public Lcom/vk/attachpicker/Picker;
.super Ljava/lang/Object;
.source "Picker.java"


# static fields
.field private static appContext:Landroid/content/Context;

.field private static final backgroundExecutor:Ljava/util/concurrent/ExecutorService;

.field private static final handler:Landroid/os/Handler;

.field private static final photoExecutorService:Ljava/util/concurrent/ExecutorService;

.field private static final timer:Ljava/util/Timer;

.field private static final videoExecutorService:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 18
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/attachpicker/Picker;->photoExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 19
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/attachpicker/Picker;->videoExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 43
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    sput-object v0, Lcom/vk/attachpicker/Picker;->timer:Ljava/util/Timer;

    .line 44
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/attachpicker/Picker;->backgroundExecutor:Ljava/util/concurrent/ExecutorService;

    .line 45
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vk/attachpicker/Picker;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 17
    sget-object v0, Lcom/vk/attachpicker/Picker;->backgroundExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public static color(I)I
    .locals 1
    .param p0, "colorResId"    # I

    .prologue
    .line 36
    sget-object v0, Lcom/vk/attachpicker/Picker;->appContext:Landroid/content/Context;

    invoke-static {v0, p0}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    return v0
.end method

.method public static executor(Z)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "forVideo"    # Z

    .prologue
    .line 40
    if-eqz p0, :cond_0

    sget-object v0, Lcom/vk/attachpicker/Picker;->videoExecutorService:Ljava/util/concurrent/ExecutorService;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/vk/attachpicker/Picker;->photoExecutorService:Ljava/util/concurrent/ExecutorService;

    goto :goto_0
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/vk/attachpicker/Picker;->appContext:Landroid/content/Context;

    return-object v0
.end method

.method public static getHeapSizeInBytes(Landroid/content/Context;)I
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 73
    const-string/jumbo v3, "activity"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 74
    .local v0, "am":Landroid/app/ActivityManager;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v4, 0x100000

    and-int/2addr v3, v4

    if-eqz v3, :cond_1

    const/4 v1, 0x1

    .line 75
    .local v1, "largeHeap":Z
    :goto_0
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v2

    .line 76
    .local v2, "memoryClass":I
    if-eqz v1, :cond_0

    .line 77
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getLargeMemoryClass()I

    move-result v2

    .line 79
    :cond_0
    mul-int/lit16 v3, v2, 0x400

    mul-int/lit16 v2, v3, 0x400

    .line 80
    return v2

    .line 74
    .end local v1    # "largeHeap":Z
    .end local v2    # "memoryClass":I
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static init(Landroid/app/Activity;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/attachpicker/Picker;->init(Landroid/content/Context;)V

    .line 25
    return-void
.end method

.method public static init(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    sput-object p0, Lcom/vk/attachpicker/Picker;->appContext:Landroid/content/Context;

    .line 29
    return-void
.end method

.method public static removeTasks(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 69
    sget-object v0, Lcom/vk/attachpicker/Picker;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 70
    return-void
.end method

.method public static run(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 61
    sget-object v0, Lcom/vk/attachpicker/Picker;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 62
    return-void
.end method

.method public static runBackground(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 48
    sget-object v0, Lcom/vk/attachpicker/Picker;->backgroundExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 49
    return-void
.end method

.method public static runBackground(Ljava/lang/Runnable;J)V
    .locals 3
    .param p0, "runnable"    # Ljava/lang/Runnable;
    .param p1, "delay"    # J

    .prologue
    .line 52
    sget-object v0, Lcom/vk/attachpicker/Picker;->timer:Ljava/util/Timer;

    new-instance v1, Lcom/vk/attachpicker/Picker$1;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/Picker$1;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1, p1, p2}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 58
    return-void
.end method

.method public static runDelayed(Ljava/lang/Runnable;J)V
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;
    .param p1, "delay"    # J

    .prologue
    .line 65
    sget-object v0, Lcom/vk/attachpicker/Picker;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 66
    return-void
.end method
