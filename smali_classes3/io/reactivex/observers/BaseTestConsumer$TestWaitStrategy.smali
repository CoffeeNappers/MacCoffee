.class public abstract enum Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;
.super Ljava/lang/Enum;
.source "BaseTestConsumer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/observers/BaseTestConsumer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "TestWaitStrategy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;",
        ">;",
        "Ljava/lang/Runnable;"
    }
.end annotation

.annotation build Lio/reactivex/annotations/Experimental;
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

.field public static final enum SLEEP_1000MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

.field public static final enum SLEEP_100MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

.field public static final enum SLEEP_10MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

.field public static final enum SLEEP_1MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

.field public static final enum SPIN:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

.field public static final enum YIELD:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 804
    new-instance v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$1;

    const-string/jumbo v1, "SPIN"

    invoke-direct {v0, v1, v3}, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->SPIN:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    .line 811
    new-instance v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$2;

    const-string/jumbo v1, "YIELD"

    invoke-direct {v0, v1, v4}, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->YIELD:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    .line 818
    new-instance v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$3;

    const-string/jumbo v1, "SLEEP_1MS"

    invoke-direct {v0, v1, v5}, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->SLEEP_1MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    .line 825
    new-instance v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$4;

    const-string/jumbo v1, "SLEEP_10MS"

    invoke-direct {v0, v1, v6}, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->SLEEP_10MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    .line 832
    new-instance v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$5;

    const-string/jumbo v1, "SLEEP_100MS"

    invoke-direct {v0, v1, v7}, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->SLEEP_100MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    .line 839
    new-instance v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$6;

    const-string/jumbo v1, "SLEEP_1000MS"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy$6;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->SLEEP_1000MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    .line 801
    const/4 v0, 0x6

    new-array v0, v0, [Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    sget-object v1, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->SPIN:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    aput-object v1, v0, v3

    sget-object v1, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->YIELD:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    aput-object v1, v0, v4

    sget-object v1, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->SLEEP_1MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    aput-object v1, v0, v5

    sget-object v1, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->SLEEP_10MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    aput-object v1, v0, v6

    sget-object v1, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->SLEEP_100MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->SLEEP_1000MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    aput-object v2, v0, v1

    sput-object v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->$VALUES:[Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 802
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILio/reactivex/observers/BaseTestConsumer$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lio/reactivex/observers/BaseTestConsumer$1;

    .prologue
    .line 802
    invoke-direct {p0, p1, p2}, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static sleep(I)V
    .locals 4
    .param p0, "millis"    # I

    .prologue
    .line 852
    int-to-long v2, p0

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 856
    return-void

    .line 853
    :catch_0
    move-exception v0

    .line 854
    .local v0, "ex":Ljava/lang/InterruptedException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static valueOf(Ljava/lang/String;)Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 801
    const-class v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    return-object v0
.end method

.method public static values()[Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;
    .locals 1

    .prologue
    .line 801
    sget-object v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->$VALUES:[Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    invoke-virtual {v0}, [Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    return-object v0
.end method


# virtual methods
.method public abstract run()V
.end method
