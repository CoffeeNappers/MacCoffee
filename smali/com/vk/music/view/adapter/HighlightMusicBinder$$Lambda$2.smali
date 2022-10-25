.class final synthetic Lcom/vk/music/view/adapter/HighlightMusicBinder$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF1;


# static fields
.field private static final instance:Lcom/vk/music/view/adapter/HighlightMusicBinder$$Lambda$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vk/music/view/adapter/HighlightMusicBinder$$Lambda$2;

    invoke-direct {v0}, Lcom/vk/music/view/adapter/HighlightMusicBinder$$Lambda$2;-><init>()V

    sput-object v0, Lcom/vk/music/view/adapter/HighlightMusicBinder$$Lambda$2;->instance:Lcom/vk/music/view/adapter/HighlightMusicBinder$$Lambda$2;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lcom/vkontakte/android/functions/VoidF1;
    .locals 1

    sget-object v0, Lcom/vk/music/view/adapter/HighlightMusicBinder$$Lambda$2;->instance:Lcom/vk/music/view/adapter/HighlightMusicBinder$$Lambda$2;

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;)V
    .locals 0
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    check-cast p1, Landroid/view/View;

    invoke-static {p1}, Lcom/vk/music/view/adapter/HighlightMusicBinder;->lambda$new$1(Landroid/view/View;)V

    return-void
.end method
