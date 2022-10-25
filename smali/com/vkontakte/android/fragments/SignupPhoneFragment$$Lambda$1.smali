.class final synthetic Lcom/vkontakte/android/fragments/SignupPhoneFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/text/InputFilter;


# static fields
.field private static final instance:Lcom/vkontakte/android/fragments/SignupPhoneFragment$$Lambda$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$$Lambda$1;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$$Lambda$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$$Lambda$1;->instance:Lcom/vkontakte/android/fragments/SignupPhoneFragment$$Lambda$1;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Landroid/text/InputFilter;
    .locals 1

    sget-object v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$$Lambda$1;->instance:Lcom/vkontakte/android/fragments/SignupPhoneFragment$$Lambda$1;

    return-object v0
.end method


# virtual methods
.method public filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static/range {p1 .. p6}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->lambda$onCreateContentView$0(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method
