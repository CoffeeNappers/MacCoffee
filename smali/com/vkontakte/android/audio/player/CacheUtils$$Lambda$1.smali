.class final synthetic Lcom/vkontakte/android/audio/player/CacheUtils$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field private static final instance:Lcom/vkontakte/android/audio/player/CacheUtils$$Lambda$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vkontakte/android/audio/player/CacheUtils$$Lambda$1;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/player/CacheUtils$$Lambda$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/player/CacheUtils$$Lambda$1;->instance:Lcom/vkontakte/android/audio/player/CacheUtils$$Lambda$1;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Ljava/util/Comparator;
    .locals 1

    sget-object v0, Lcom/vkontakte/android/audio/player/CacheUtils$$Lambda$1;->instance:Lcom/vkontakte/android/audio/player/CacheUtils$$Lambda$1;

    return-object v0
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    check-cast p1, Ljava/io/File;

    check-cast p2, Ljava/io/File;

    invoke-static {p1, p2}, Lcom/vkontakte/android/audio/player/CacheUtils;->lambda$clearOldCache$0(Ljava/io/File;Ljava/io/File;)I

    move-result v0

    return v0
.end method
