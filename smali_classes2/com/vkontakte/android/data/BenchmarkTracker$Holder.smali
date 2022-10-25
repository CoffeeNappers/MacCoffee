.class Lcom/vkontakte/android/data/BenchmarkTracker$Holder;
.super Ljava/lang/Object;
.source "BenchmarkTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/BenchmarkTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Holder"
.end annotation


# static fields
.field private static final INSTANCE:Lcom/vkontakte/android/data/BenchmarkTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 42
    new-instance v0, Lcom/vkontakte/android/data/BenchmarkTracker;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/data/BenchmarkTracker;-><init>(Lcom/vkontakte/android/data/BenchmarkTracker$1;)V

    sput-object v0, Lcom/vkontakte/android/data/BenchmarkTracker$Holder;->INSTANCE:Lcom/vkontakte/android/data/BenchmarkTracker;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100()Lcom/vkontakte/android/data/BenchmarkTracker;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/vkontakte/android/data/BenchmarkTracker$Holder;->INSTANCE:Lcom/vkontakte/android/data/BenchmarkTracker;

    return-object v0
.end method
