.class final synthetic Lcom/vk/music/view/RecommendedContainer$1$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/music/view/RecommendedContainer$1;

.field private final arg$2:Lcom/vkontakte/android/audio/MusicTrack;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/RecommendedContainer$1;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/music/view/RecommendedContainer$1$$Lambda$1;->arg$1:Lcom/vk/music/view/RecommendedContainer$1;

    iput-object p2, p0, Lcom/vk/music/view/RecommendedContainer$1$$Lambda$1;->arg$2:Lcom/vkontakte/android/audio/MusicTrack;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/music/view/RecommendedContainer$1;Lcom/vkontakte/android/audio/MusicTrack;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/music/view/RecommendedContainer$1$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/music/view/RecommendedContainer$1$$Lambda$1;-><init>(Lcom/vk/music/view/RecommendedContainer$1;Lcom/vkontakte/android/audio/MusicTrack;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/music/view/RecommendedContainer$1$$Lambda$1;->arg$1:Lcom/vk/music/view/RecommendedContainer$1;

    iget-object v1, p0, Lcom/vk/music/view/RecommendedContainer$1$$Lambda$1;->arg$2:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v0, v1, p1, p2}, Lcom/vk/music/view/RecommendedContainer$1;->lambda$onActionClick$0(Lcom/vkontakte/android/audio/MusicTrack;Landroid/content/DialogInterface;I)V

    return-void
.end method
