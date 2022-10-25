.class final synthetic Lcom/vkontakte/android/ui/binder/LikeBarBinder$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/F1;


# static fields
.field private static final instance:Lcom/vkontakte/android/ui/binder/LikeBarBinder$$Lambda$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$$Lambda$1;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/binder/LikeBarBinder$$Lambda$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$$Lambda$1;->instance:Lcom/vkontakte/android/ui/binder/LikeBarBinder$$Lambda$1;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lcom/vkontakte/android/functions/F1;
    .locals 1

    sget-object v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder$$Lambda$1;->instance:Lcom/vkontakte/android/ui/binder/LikeBarBinder$$Lambda$1;

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    check-cast p1, Lcom/vkontakte/android/data/LikeInfo;

    invoke-static {p1}, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->lambda$bind$0(Lcom/vkontakte/android/data/LikeInfo;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
