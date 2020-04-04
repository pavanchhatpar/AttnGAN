if [ ! -f "./.env" ]; then
    echo "Make a file `.env` and add content in it as shown in the sample below"
    echo ""
    echo "export BIRDSMETA=\"./drive/My Drive/Spring 20/Spec. AI/birds.zip\""
    echo "export DAMSMBIRD=\"./drive/My Drive/Spring 20/Spec. AI/bird.zip\""
    echo "export GANBIRD=\"./drive/My Drive/Spring 20/Spec. AI/bird_AttnGAN2.pth\""
    exit 2
fi

pip install python-dateutil easydict pandas torchfile nltk scikit-image
pip install http://download.pytorch.org/whl/cu90/torch-0.3.1-cp27-cp27mu-linux_x86_64.whl
pip install torchvision==0.2.1

source "./.env"

unzip $BIRDSMETA -d "./AttnGAN/data"
unzip $DAMSMBIRD -d "./AttnGAN/DAMSMencoders"
cp $GANBIRD "./AttnGAN/models"
wget http://www.vision.caltech.edu/visipedia-data/CUB-200-2011/CUB_200_2011.tgz -O CUB_200_2011.tgz
tar xvzf CUB_200_2011.tgz -C ./AttnGAN/data/birds
rm CUB_200_2011.tgz
echo "**********Environment ready************"