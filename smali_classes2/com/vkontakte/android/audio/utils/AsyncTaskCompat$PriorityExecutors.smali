.class Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;
.super Ljava/lang/Object;
.source "AsyncTaskCompat.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/utils/AsyncTaskCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PriorityExecutors"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/Runnable;",
        ">;"
    }
.end annotation


# instance fields
.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mExecutors:[Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;

.field private final mRunnablePriorityMap:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/Runnable;",
            "Lcom/vkontakte/android/audio/utils/Priority;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 8
    .param p1, "poolSize"    # I

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/PriorityBlockingQueue;

    const/16 v2, 0xa

    invoke-direct {v7, v2, p0}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>(ILjava/util/Comparator;)V

    move v2, p1

    move v3, p1

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->mExecutor:Ljava/util/concurrent/Executor;

    .line 45
    sget-object v1, Lcom/vkontakte/android/audio/utils/Priority;->VALUES:[Lcom/vkontakte/android/audio/utils/Priority;

    array-length v1, v1

    new-array v1, v1, [Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;

    iput-object v1, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->mExecutors:[Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;

    .line 46
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->mExecutors:[Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 47
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->mExecutors:[Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;

    new-instance v2, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;

    sget-object v3, Lcom/vkontakte/android/audio/utils/Priority;->VALUES:[Lcom/vkontakte/android/audio/utils/Priority;

    aget-object v3, v3, v0

    invoke-direct {v2, p0, v3}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;-><init>(Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;Lcom/vkontakte/android/audio/utils/Priority;)V

    aput-object v2, v1, v0

    .line 46
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 48
    :cond_0
    new-instance v1, Ljava/util/WeakHashMap;

    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->mRunnablePriorityMap:Ljava/util/WeakHashMap;

    .line 49
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;)Ljava/util/WeakHashMap;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->mRunnablePriorityMap:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;)Ljava/util/concurrent/Executor;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->mExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 38
    check-cast p1, Ljava/lang/Runnable;

    check-cast p2, Ljava/lang/Runnable;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->compare(Ljava/lang/Runnable;Ljava/lang/Runnable;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/Runnable;Ljava/lang/Runnable;)I
    .locals 4
    .param p1, "lhs"    # Ljava/lang/Runnable;
    .param p2, "rhs"    # Ljava/lang/Runnable;

    .prologue
    .line 55
    iget-object v3, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->mRunnablePriorityMap:Ljava/util/WeakHashMap;

    monitor-enter v3

    .line 56
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->mRunnablePriorityMap:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/audio/utils/Priority;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/utils/Priority;->ordinal()I

    move-result v0

    .line 57
    .local v0, "lhsPriorityOrdinal":I
    iget-object v2, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->mRunnablePriorityMap:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/audio/utils/Priority;

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/utils/Priority;->ordinal()I

    move-result v1

    .line 58
    .local v1, "rhsPriorityOrdinal":I
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->compareIntegers(II)I

    move-result v2

    return v2

    .line 58
    .end local v0    # "lhsPriorityOrdinal":I
    .end local v1    # "rhsPriorityOrdinal":I
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public getExecutor(Lcom/vkontakte/android/audio/utils/Priority;)Ljava/util/concurrent/Executor;
    .locals 2
    .param p1, "priority"    # Lcom/vkontakte/android/audio/utils/Priority;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors;->mExecutors:[Lcom/vkontakte/android/audio/utils/AsyncTaskCompat$PriorityExecutors$PriorityExecutor;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/utils/Priority;->ordinal()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method
