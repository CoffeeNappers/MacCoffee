.class final synthetic Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;


# static fields
.field private static final instance:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$$Lambda$5;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$$Lambda$5;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$$Lambda$5;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$$Lambda$5;->instance:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$$Lambda$5;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$UrlCreator;
    .locals 1

    sget-object v0, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$$Lambda$5;->instance:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$$Lambda$5;

    return-object v0
.end method


# virtual methods
.method public createUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static {p1, p2}, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;->createUrlHttp(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
