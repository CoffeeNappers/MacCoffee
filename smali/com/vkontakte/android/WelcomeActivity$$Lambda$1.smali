.class final synthetic Lcom/vkontakte/android/WelcomeActivity$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/WelcomeActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/WelcomeActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/WelcomeActivity$$Lambda$1;->arg$1:Lcom/vkontakte/android/WelcomeActivity;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/WelcomeActivity;)Landroid/widget/CompoundButton$OnCheckedChangeListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/WelcomeActivity$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/WelcomeActivity$$Lambda$1;-><init>(Lcom/vkontakte/android/WelcomeActivity;)V

    return-object v0
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/WelcomeActivity$$Lambda$1;->arg$1:Lcom/vkontakte/android/WelcomeActivity;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/WelcomeActivity;->lambda$onCreate$0(Landroid/widget/CompoundButton;Z)V

    return-void
.end method