.class Lcom/android/phone/HtcCdmaUnknowMccScreen$2;
.super Landroid/os/Handler;
.source "HtcCdmaUnknowMccScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/HtcCdmaUnknowMccScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/HtcCdmaUnknowMccScreen;


# direct methods
.method constructor <init>(Lcom/android/phone/HtcCdmaUnknowMccScreen;)V
    .locals 0
    .parameter

    .prologue
    .line 76
    iput-object p1, p0, Lcom/android/phone/HtcCdmaUnknowMccScreen$2;->this$0:Lcom/android/phone/HtcCdmaUnknowMccScreen;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 79
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 84
    :goto_0
    return-void

    .line 81
    :pswitch_0
    iget-object v0, p0, Lcom/android/phone/HtcCdmaUnknowMccScreen$2;->this$0:Lcom/android/phone/HtcCdmaUnknowMccScreen;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/phone/HtcCdmaUnknowMccScreen;->showDialog(I)V

    goto :goto_0

    .line 79
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method