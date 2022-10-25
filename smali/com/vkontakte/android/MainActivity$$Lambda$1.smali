.class final synthetic Lcom/vkontakte/android/MainActivity$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/text/Html$ImageGetter;


# instance fields
.field private final arg$1:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/MainActivity$$Lambda$1;->arg$1:Landroid/content/Context;

    return-void
.end method

.method public static lambdaFactory$(Landroid/content/Context;)Landroid/text/Html$ImageGetter;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/MainActivity$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/MainActivity$$Lambda$1;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/MainActivity$$Lambda$1;->arg$1:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/vkontakte/android/MainActivity;->lambda$showAbout$0(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method
