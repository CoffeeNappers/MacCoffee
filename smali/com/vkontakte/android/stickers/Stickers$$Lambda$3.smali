.class final synthetic Lcom/vkontakte/android/stickers/Stickers$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/stickers/Stickers;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/stickers/Stickers;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/stickers/Stickers$$Lambda$3;->arg$1:Lcom/vkontakte/android/stickers/Stickers;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/stickers/Stickers;)Lio/reactivex/functions/Consumer;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/stickers/Stickers$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/stickers/Stickers$$Lambda$3;-><init>(Lcom/vkontakte/android/stickers/Stickers;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/stickers/Stickers$$Lambda$3;->arg$1:Lcom/vkontakte/android/stickers/Stickers;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/stickers/Stickers;->lambda$markNewItemsAsViewed$3(Ljava/lang/Object;)V

    return-void
.end method
